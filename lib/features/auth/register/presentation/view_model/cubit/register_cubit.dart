import 'package:bloc/bloc.dart';
import 'package:exam_app/config/error/failures.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_validators/auth_validaters.dart';
import 'package:exam_app/features/auth/register/data/models/request/signup_request.dart';
import 'package:exam_app/features/auth/register/domain/use_case/register_use_case.dart';
import 'package:injectable/injectable.dart';
part 'register_states.dart';
@Injectable()
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super( RegisterState());

  Future<void> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async {
    if (state.isLoading) return;

    /// clear errors + start loading
    emit(state.copyWith(
      isLoading: true,
      usernameError: null,
      firstNameError: null,
      lastNameError: null,
      emailError: null,
      passwordError: null,
      confirmPasswordError: null,
      phoneError: null,
      generalError: null,
    ));

    /// validation
    final usernameErr =
        username.trim().isEmpty ? AuthConsts.errorusername : null;

    final firstNameErr =
        firstName.trim().isEmpty ? AuthConsts.errorfirstname : null;

    final lastNameErr =
        lastName.trim().isEmpty ? AuthConsts.errorlastname : null;

    final emailErr =
        !AuthValidators.isValidEmail(email) ? AuthConsts.erroremail : null;

    final passwordErr =
        !AuthValidators.isValidPassword(password) ? AuthConsts.errorpassword : null;

    final confirmPasswordErr =
        !AuthValidators.isPasswordMatch(password, confirmPassword)
            ? AuthConsts.errorconfirmpassword
            : null;

    final phoneErr =
        !AuthValidators.isValidPhone(phone) ? AuthConsts.errorphone : null;

    /// if validation failed
    if (usernameErr != null ||
        firstNameErr != null ||
        lastNameErr != null ||
        emailErr != null ||
        passwordErr != null ||
        confirmPasswordErr != null ||
        phoneErr != null) {
      emit(state.copyWith(
        isLoading: false,
        usernameError: usernameErr,
        firstNameError: firstNameErr,
        lastNameError: lastNameErr,
        emailError: emailErr,
        passwordError: passwordErr,
        confirmPasswordError: confirmPasswordErr,
        phoneError: phoneErr,
      ));
      return;
    }

    /// call API
    final result = await _registerUseCase(
      SignupRequest(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: confirmPassword,
        phone: phone,
      ),
    );

    result.when(
      success: (_) {
        emit(state.copyWith(
          isLoading: false,
          registerSuccess: true,
        ));
      },
      error: (exception) {
        final message = exception is Failures
            ? exception.errorMessage
            : AuthConsts.registerError;

        emit(state.copyWith(
          isLoading: false,
          generalError: message,
        ));
      },
    );
  }
}