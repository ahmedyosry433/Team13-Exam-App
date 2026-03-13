// TODO: api Forget_passwordRemoteDataSourceImpl

import 'package:exam_app/config/api/api_executer.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/classes/params.dart';
import 'package:exam_app/features/forget_password/api/api_client/forget_password_api_client.dart';
import 'package:exam_app/features/forget_password/data/datasources/forget_password_remote_data_source_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRemoteDataSourceContract)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSourceContract {
  final ForgetPasswordApiClient apiClient;
  ForgetPasswordRemoteDataSourceImpl({required this.apiClient});
  @override
  Future<Result<void>> sendOtp(ForgetPasswordParams params) async {
    return await executeApi<void>(() {
      return apiClient.sendOtp(params);
    });
  }

  @override
  Future<Result<void>> resetPassword(ForgetPasswordParams params) async {
    return await executeApi<void>(() {
      return apiClient.resetPassword(params);
    });
  }

  @override
  Future<Result<void>> verifyCode(ForgetPasswordParams params) async {
    return await executeApi<void>(() {
      return apiClient.verifyCode(params);
    });
  }
}
