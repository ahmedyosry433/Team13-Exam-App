import 'package:dio/dio.dart';
import 'package:exam_app/config/api/app_endpoints.dart';
import 'package:exam_app/features/auth/register/data/models/request/signup_request.dart';
import 'package:exam_app/features/auth/register/data/models/responce/signup_responce.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'register_api_client.g.dart';

@injectable
@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class SignupApi {
  @factoryMethod
  factory SignupApi(Dio dio) = _SignupApi;

  @POST(AppEndPoints.signupEndpoint)
  Future<Signupresponce> signup(@Body() SignupRequest uprequest);
}
