import 'package:dio/dio.dart';
import 'package:exam_app/config/api/app_endpoints.dart';
import 'package:exam_app/core/classes/params.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'forget_password_api_client.g.dart';

@injectable
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;
  @POST(AppEndPoints.forgetPasswordEndpoint)
  Future<void> sendOtp(@Body() ForgetPasswordParams params);

  @POST(AppEndPoints.verifyCodeEndpoint)
  Future<void> verifyCode(@Body() ForgetPasswordParams params);

  @PUT(AppEndPoints.resetPasswordEndpoint)
  Future<void> resetPassword(@Body() ForgetPasswordParams params);
}
