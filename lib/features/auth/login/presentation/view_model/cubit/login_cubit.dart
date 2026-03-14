// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/config/error/failures.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/login/data/models/request/signin_request.dart';
import 'package:exam_app/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase = getIt<LoginUseCase>();
  final FlutterSecureStorage _fss = getIt<FlutterSecureStorage>();

  LoginCubit() : super(LoginState());

  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  Future<void> login({required String email, required String password}) async {
    emit(
      state.copyWith(
        isLoading: true,
        emailError: null,
        passwordError: null,
        generalError: null,
      ),
    );

    if (email.isEmpty) {
      emit(state.copyWith(isLoading: false, emailError: AuthConsts.erroremail));
      return;
    }
    if (password.isEmpty || password.length < 8) {
      emit(
        state.copyWith(
          isLoading: false,
          passwordError: AuthConsts.errorpassword,
        ),
      );
      return;
    }

    final result = await _loginUseCase(
      SigninRequest(email: email, password: password),
    );

    result.when(
      success: (entity) async {
        if (state.rememberMe) {
          await _fss.write(key: 'token', value: entity!.token);
        } else {
          await _fss.delete(key: 'token');
        }
        emit(state.copyWith(isLoading: false, loginSuccess: true));
      },
      error: (exception) {
        final message = exception is Failures
            ? exception.errorMessage
            : AuthConsts.loginError;
        emit(state.copyWith(isLoading: false, generalError: message));
      },
    );
  }

  Future<void> autoLoginIfTokenExists(BuildContext context) async {
    final token = await _fss.read(key: 'token');
    if (token != null) {
      context.push(Routes.home);
    }
  }
}
