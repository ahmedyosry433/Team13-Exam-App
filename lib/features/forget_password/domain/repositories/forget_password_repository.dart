// TODO: domain Forget_passwordRepository
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/classes/params.dart';

abstract class ForgetPasswordRepository {
  Future<Result<void>> sendOtp(ForgetPasswordParams params);
  Future<Result<void>> verifyCode(ForgetPasswordParams params);
  Future<Result<void>> resetPassword(ForgetPasswordParams params);
}
