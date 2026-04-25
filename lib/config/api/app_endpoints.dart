class AppEndPoints {
  AppEndPoints._();
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';
  static const String getProductsEndpoint = '/products';
  static const String getCategoriesEndpoint = '/categories';
  static const String refreshToken = '/refresh-token';
  static const String loggedUserInfo = '/auth/profileData';
  static const String editProfile = '/auth/editProfile';
  static const String changePassword = '/auth/changePassword';
}
