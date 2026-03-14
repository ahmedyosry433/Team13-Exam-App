import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/register/data/models/request/signup_request.dart';
import 'package:exam_app/features/auth/register/domain/entity/register_entity.dart';

abstract class RegisterRepositoryContract {
  Future<Result<SignupEntity>> signup(SignupRequest signupRequest);
}