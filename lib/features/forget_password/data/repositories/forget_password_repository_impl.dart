// TODO: data Forget_passwordRepositoryImpl

import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/classes/params.dart';
import 'package:exam_app/features/forget_password/data/datasources/forget_password_remote_data_source_contract.dart';
import 'package:exam_app/features/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordRemoteDataSourceContract remoteDataSourceContract;
  ForgetPasswordRepositoryImpl({required this.remoteDataSourceContract});
  @override
  Future<Result<void>> sendOtp(ForgetPasswordParams params) async {
    return await remoteDataSourceContract.sendOtp(params);
  }

  @override
  Future<Result<void>> resetPassword(ForgetPasswordParams params) async {
    return await remoteDataSourceContract.resetPassword(params);
  }

  @override
  Future<Result<void>> verifyCode(ForgetPasswordParams params) async {
    return await remoteDataSourceContract.verifyCode(params);
  }
}
