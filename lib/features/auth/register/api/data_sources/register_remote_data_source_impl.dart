import 'package:dio/dio.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/error/failures.dart';
import 'package:exam_app/features/auth/register/api/api_client/register_api_client.dart';
import 'package:exam_app/features/auth/register/data/data_sources/register_remote_data_source_contract.dart';
import 'package:exam_app/features/auth/register/data/models/request/signup_request.dart';
import 'package:exam_app/features/auth/register/data/models/responce/signup_responce.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRemoteDataSourceContract)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSourceContract {
  RegisterRemoteDataSourceImpl(this.signupApi);
  final SignupApi signupApi;
  @override
   Future<Result<Signupresponce>> signup(SignupRequest uprequest) async {
    try {
      final responce = await signupApi.signup(uprequest);
      return Success<Signupresponce>(data: responce);
    } on DioException catch (e) {
  return Error(exception: ServerFailure.fromDioException(dioException: e));
}
  }
}