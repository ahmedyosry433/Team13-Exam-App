import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/register/data/models/request/signup_request.dart';
import 'package:exam_app/features/auth/register/domain/entity/register_entity.dart';
import 'package:exam_app/features/auth/register/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegisterUseCase {
  final RegisterRepositoryContract repository;
  RegisterUseCase({required this.repository});
  Future<Result<SignupEntity>> call(SignupRequest uprequest) async {
    return await repository.signup(uprequest);
  }
  
}