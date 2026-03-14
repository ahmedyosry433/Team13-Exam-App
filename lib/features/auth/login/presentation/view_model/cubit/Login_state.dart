part of 'login_cubit.dart';

class LoginState {
  final bool isLoading;
  final bool rememberMe;
  final String? emailError;
  final String? passwordError;
  final String? generalError;
  final bool? loginSuccess;

  LoginState({
    this.isLoading = false,
    this.rememberMe = false,
    this.emailError,
    this.passwordError,
    this.generalError,
    this.loginSuccess,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? rememberMe,
    String? emailError,
    String? passwordError,
    String? generalError,
    bool? loginSuccess,
    
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      rememberMe: rememberMe ?? this.rememberMe,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      generalError: generalError ?? this.generalError,
      loginSuccess: loginSuccess ?? this.loginSuccess,
    );
  }
  
}