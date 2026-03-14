import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/data/models/request/signin_request.dart';
import 'package:exam_app/features/auth/login/data/models/responce/signin_responce.dart';

abstract class LoginRemoteDataSourceContract {
  Future<Result<SigninResponse>> signin(SigninRequest inrequest);
  
}
