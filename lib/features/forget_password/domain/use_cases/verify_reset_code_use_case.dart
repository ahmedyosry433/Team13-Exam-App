import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/classes/params.dart';
import 'package:injectable/injectable.dart';
import '../repositories/forget_password_repository.dart';

@injectable
class VerifyResetCodeUseCase {
  final ForgetPasswordRepository repository;

  const VerifyResetCodeUseCase(this.repository);

  Future<Result<void>> call(ForgetPasswordParams params) {
    return repository.verifyCode(params);
  }
}
