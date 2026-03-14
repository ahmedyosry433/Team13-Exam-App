import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/auth/login/data/models/request/signin_request.dart';
import 'package:exam_app/features/auth/login/domain/entity/signin_entity.dart';
import 'package:exam_app/features/auth/login/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase {
final LoginRepositoryContract repository;

  LoginUseCase({ required this.repository});
  Future<Result<SigninEntity>> call(SigninRequest inrequest) async {
    return await repository.signin(inrequest);
  }

}