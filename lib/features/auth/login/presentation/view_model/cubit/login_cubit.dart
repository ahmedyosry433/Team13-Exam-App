// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/config/error/failures.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_validators/auth_validaters.dart';
import 'package:exam_app/features/auth/login/data/models/request/signin_request.dart';
import 'package:exam_app/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:injectable/injectable.dart';
part 'login_state.dart';

@Injectable()
class LogInCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase = getIt<LoginUseCase>();

  LogInCubit() : super(LoginState());

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

    if (!AuthValidators.isValidEmail(email)) {
      emit(state.copyWith(isLoading: false, emailError: AuthConsts.erroremail));
      return;
    }
    if (!AuthValidators.isValidPassword(password)) {
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
}
