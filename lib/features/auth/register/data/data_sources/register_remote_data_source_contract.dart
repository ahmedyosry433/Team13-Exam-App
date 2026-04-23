import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/register/data/models/request/signup_request.dart';
import 'package:exam_app/features/auth/register/data/models/responce/signup_responce.dart';

abstract class RegisterRemoteDataSourceContract {
  Future<Result<Signupresponce>> signup(SignupRequest uprequest);
}
