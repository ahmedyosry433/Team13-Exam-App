import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/config/error/failures.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:exam_app/features/auth/login/data/models/request/signin_request.dart';
import 'package:exam_app/features/auth/login/data/models/responce/signin_responce.dart';
import 'package:exam_app/features/auth/login/domain/entity/signin_entity.dart';
import 'package:exam_app/features/auth/login/domain/repositories/login_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepositoryContract)
class LoginRepositoryImpl implements LoginRepositoryContract {
  final LoginRemoteDataSourceContract loginRemoteDataSourceContract;
  LoginRepositoryImpl(this.loginRemoteDataSourceContract);
  @override
  Future<Result<SigninEntity>> signin(SigninRequest inrequest) async {
    try {
      final response = await loginRemoteDataSourceContract.signin(inrequest);
      switch (response) {
        case Success<SigninResponse>(data: final data):
          if (data == null || data.user == null) {
            return Error<SigninEntity>(
              exception: ServerFailure(errorMessage: AuthConsts.erroruser),
            );
          }

          final fss = getIt<FlutterSecureStorage>();
          await fss.write(key: 'token', value: data.token);

          final entity = data.user?.toDomain();

          return Success<SigninEntity>(data: entity);

        case Error<SigninResponse>(exception: final exception):
          return Error<SigninEntity>(exception: exception);
      }
    } catch (e) {
      return Error<SigninEntity>(
        exception: ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
