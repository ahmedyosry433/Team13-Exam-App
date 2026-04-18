class AppEndPoints {
  AppEndPoints._();
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';
  static const String getAllSubjects='$baseUrl/subjects';
  static const String getProductsEndpoint = '$baseUrl/products';
  static const String getCategoriesEndpoint = '$baseUrl/categories';
  static const String refreshToken = '$baseUrl/refresh-token';
}
