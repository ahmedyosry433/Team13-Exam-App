class AppEndPoints {
  AppEndPoints._();
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';
  static const String signupEndpoint = '/auth/signup';
  static const String signinEndpoint = '/auth/signin';
  static const String refreshToken = '/refresh-token';
  static const String forgetPasswordEndpoint = '/auth/forgotPassword';
  static const String verifyCodeEndpoint = '/auth/verifyResetCode';
  static const String resetPasswordEndpoint = '/auth/resetPassword';
}
