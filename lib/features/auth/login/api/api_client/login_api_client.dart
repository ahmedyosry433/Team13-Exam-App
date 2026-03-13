import 'package:dio/dio.dart';
import 'package:exam_app/config/api/app_endpoints.dart';
import 'package:exam_app/features/auth/login/data/models/request/signin_request.dart';
import 'package:exam_app/features/auth/login/data/models/responce/signin_responce.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_client.g.dart';

@injectable
@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class SigninApi {
  @factoryMethod
  factory SigninApi(Dio dio) = _SigninApi;

  @POST(AppEndPoints.signinEndpoint)
  Future<Signinresponce> signin(@Body() SigninRequest inrequest);
}
