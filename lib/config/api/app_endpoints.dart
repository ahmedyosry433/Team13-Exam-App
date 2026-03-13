class AppEndPoints {
  AppEndPoints._();
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1/auth';
  static const String signupEndpoint = '$baseUrl/signup';
  static const String signinEndpoint = '$baseUrl/signin';
  static const String refreshToken = '$baseUrl/refresh-token';
}
