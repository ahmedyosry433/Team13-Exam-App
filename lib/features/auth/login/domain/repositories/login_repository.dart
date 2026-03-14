import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/data/models/request/signin_request.dart';
import 'package:exam_app/features/auth/login/domain/entity/signin_entity.dart';

abstract class LoginRepositoryContract {
  Future<Result<SigninEntity>> signin(SigninRequest inrequest);
}
