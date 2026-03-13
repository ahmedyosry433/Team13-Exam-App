class AuthValidators {
  AuthValidators._();

  static final _emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  static bool isValidEmail(String email) =>
      _emailRegex.hasMatch(email.trim());

  static bool isValidPassword(String password) =>
      password.trim().length >= 8;
}
