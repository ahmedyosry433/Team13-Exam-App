
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/config/error/failures.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/register/data/data_sources/register_remote_data_source_contract.dart';
import 'package:exam_app/features/auth/register/data/models/request/signup_request.dart';
import 'package:exam_app/features/auth/register/data/models/responce/signup_responce.dart';
import 'package:exam_app/features/auth/register/domain/entity/register_entity.dart';
import 'package:exam_app/features/auth/register/domain/repositories/register_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepositoryContract)
class RegisterRepositoryImpl implements RegisterRepositoryContract {
  final RegisterRemoteDataSourceContract registerRemoteDataSourceContract;
  RegisterRepositoryImpl(this.registerRemoteDataSourceContract);
  @override
  Future<Result<SignupEntity>> signup(SignupRequest uprequest) async {
    try {
      final response = await registerRemoteDataSourceContract.signup(uprequest);
      switch (response) {
        case Success<Signupresponce>(data: final data):
          if (data == null || data.user == null) {
            return Error<SignupEntity>(
              exception: ServerFailure(errorMessage: AuthConsts.erroruser),
            );
          }

          final fss = getIt<FlutterSecureStorage>();
          await fss.write(key: 'token', value: data.token);

          final entity = data.user?.toDomain();

          return Success<SignupEntity>(data: entity);

        case Error<Signupresponce>(exception: final exception):
          return Error<SignupEntity>(exception: exception);
      }
    } catch (e) {
      return Error<SignupEntity>(
        exception: ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
