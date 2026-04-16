import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/classes/params.dart';
import 'package:injectable/injectable.dart';

import '../repositories/forget_password_repository.dart';

@injectable
class SendOtpUseCase {
  final ForgetPasswordRepository repository;

  const SendOtpUseCase({required this.repository});

  Future<Result<void>> call(ForgetPasswordParams params) async {
    return await repository.sendOtp(params);
  }
}
