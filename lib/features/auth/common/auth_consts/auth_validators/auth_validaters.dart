class AuthValidators {
  AuthValidators._();

  static final _emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  static bool isValidEmail(String email) => _emailRegex.hasMatch(email.trim());

  static bool isValidPassword(String password) {
    final regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    );
    return regex.hasMatch(password.trim());
  }

  static bool isPasswordMatch(String password, String confirmPassword) =>
      password.trim() == confirmPassword.trim();

  static bool isValidPhone(String phone) {
    final clean = phone.trim();
    if (clean.isEmpty) return false;
    final formatted = clean.startsWith('+20')
        ? '0${clean.substring(3)}'
        : clean;
    final regex = RegExp(r'^01[0125][0-9]{8}$');
    return regex.hasMatch(formatted);
  }
}