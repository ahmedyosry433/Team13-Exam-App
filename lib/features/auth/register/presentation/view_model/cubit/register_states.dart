part of 'register_cubit.dart';

class RegisterState {
  final bool isLoading;
  final bool registerSuccess;
  final String? usernameError;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final String? phoneError;
  final String? generalError;

  RegisterState({
    this.isLoading = false,
    this.registerSuccess = false,
    this.usernameError,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.phoneError,
    this.generalError,
  });

  RegisterState copyWith({
    bool? isLoading,
    bool? registerSuccess,
    String? usernameError,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? phoneError,
    String? generalError,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      registerSuccess: registerSuccess ?? this.registerSuccess,
      usernameError: usernameError ?? this.usernameError,
      firstNameError: firstNameError ?? this.firstNameError,
      lastNameError: lastNameError ?? this.lastNameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      phoneError: phoneError ?? this.phoneError,
      generalError: generalError ?? this.generalError,
    );
  }
}