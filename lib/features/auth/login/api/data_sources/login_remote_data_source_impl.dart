import 'package:dio/dio.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/error/failures.dart';
import 'package:exam_app/features/auth/login/api/api_client/login_api_client.dart';
import 'package:exam_app/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:exam_app/features/auth/login/data/models/request/signin_request.dart';
import 'package:exam_app/features/auth/login/data/models/responce/signin_responce.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSourceContract)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSourceContract {
  LoginRemoteDataSourceImpl(this.signinApi);
  final SigninApi signinApi;
  @override
  Future<Result<SigninResponse>> signin(SigninRequest inrequest) async {
    try {
      final responce = await signinApi.signin(inrequest);
        print( "User data stored in secure storage:--------------------------------------- ${responce.user}");
      return Success<SigninResponse>(data: responce);
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(dioException: e);
    }
  }
}
