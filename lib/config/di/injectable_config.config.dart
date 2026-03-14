// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/user_helper/user_helper.dart' as _i589;
import '../../features/auth/login/api/api_client/login_api_client.dart' as _i32;
import '../../features/auth/login/api/data_sources/login_remote_data_source_impl.dart'
    as _i584;
import '../../features/auth/login/data/data_sources/login_remote_data_source_contract.dart'
    as _i183;
import '../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i470;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i176;
import '../../features/auth/login/domain/use_case/login_use_case.dart' as _i630;
import '../../features/auth/login/presentation/view_model/cubit/login_cubit.dart'
    as _i609;
import '../../features/auth/register/api/api_client/register_api_client.dart'
    as _i517;
import '../../features/auth/register/api/data_sources/register_remote_data_source_impl.dart'
    as _i743;
import '../../features/auth/register/data/data_sources/register_remote_data_source_contract.dart'
    as _i953;
import '../../features/auth/register/data/repositories/register_repository_impl.dart'
    as _i200;
import '../../features/auth/register/domain/repositories/register_repository.dart'
    as _i57;
import '../../features/auth/register/domain/use_case/register_use_case.dart'
    as _i21;
import '../../features/auth/register/presentation/view_model/cubit/register_cubit.dart'
    as _i444;
import '../../features/forget_password/api/api_client/forget_password_api_client.dart'
    as _i892;
import '../../features/forget_password/api/datasources/forget_password_remote_data_source_impl.dart'
    as _i358;
import '../../features/forget_password/data/datasources/forget_password_remote_data_source_contract.dart'
    as _i913;
import '../../features/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i787;
import '../../features/forget_password/domain/repositories/forget_password_repository.dart'
    as _i129;
import '../../features/forget_password/domain/use_cases/reset_password_use_case.dart'
    as _i56;
import '../../features/forget_password/domain/use_cases/send_otp_use_case.dart'
    as _i862;
import '../../features/forget_password/domain/use_cases/verify_reset_code_use_case.dart'
    as _i798;
import '../../features/forget_password/presentation/view_model/cubit/forget_password_cubit.dart'
    as _i955;
import '../api/app_interceptors.dart' as _i781;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreInjectableModule = _$CoreInjectableModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreInjectableModule.prefs(),
      preResolve: true,
    );
    gh.factory<_i609.LoginCubit>(() => _i609.LoginCubit());
    gh.singleton<_i361.Dio>(() => coreInjectableModule.dio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => coreInjectableModule.secureStorage(),
    );
    gh.lazySingleton<_i361.CancelToken>(
      () => coreInjectableModule.cancelToken(),
    );
    gh.lazySingleton<_i161.InternetConnection>(
      () => coreInjectableModule.internetConnection(),
    );
    gh.factory<_i32.SigninApi>(() => _i32.SigninApi(gh<_i361.Dio>()));
    gh.factory<_i517.SignupApi>(() => _i517.SignupApi(gh<_i361.Dio>()));
    gh.factory<_i892.ForgetPasswordApiClient>(
      () => _i892.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i183.LoginRemoteDataSourceContract>(
      () => _i584.LoginRemoteDataSourceImpl(gh<_i32.SigninApi>()),
    );
    gh.singleton<_i781.AppInterceptors>(
      () => _i781.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i913.ForgetPasswordRemoteDataSourceContract>(
      () => _i358.ForgetPasswordRemoteDataSourceImpl(
        apiClient: gh<_i892.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i953.RegisterRemoteDataSourceContract>(
      () => _i743.RegisterRemoteDataSourceImpl(gh<_i517.SignupApi>()),
    );
    gh.factory<_i129.ForgetPasswordRepository>(
      () => _i787.ForgetPasswordRepositoryImpl(
        remoteDataSourceContract:
            gh<_i913.ForgetPasswordRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i862.SendOtpUseCase>(
      () => _i862.SendOtpUseCase(
        repository: gh<_i129.ForgetPasswordRepository>(),
      ),
    );
    gh.factory<_i589.UserHelper>(
      () => _i589.UserHelper(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i176.LoginRepositoryContract>(
      () =>
          _i470.LoginRepositoryImpl(gh<_i183.LoginRemoteDataSourceContract>()),
    );
    gh.factory<_i630.LoginUseCase>(
      () => _i630.LoginUseCase(repository: gh<_i176.LoginRepositoryContract>()),
    );
    gh.factory<_i57.RegisterRepositoryContract>(
      () => _i200.RegisterRepositoryImpl(
        gh<_i953.RegisterRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i56.ResetPasswordUseCase>(
      () => _i56.ResetPasswordUseCase(gh<_i129.ForgetPasswordRepository>()),
    );
    gh.factory<_i798.VerifyResetCodeUseCase>(
      () => _i798.VerifyResetCodeUseCase(gh<_i129.ForgetPasswordRepository>()),
    );
    gh.factory<_i955.ForgetPasswordCubit>(
      () => _i955.ForgetPasswordCubit(
        gh<_i862.SendOtpUseCase>(),
        gh<_i798.VerifyResetCodeUseCase>(),
        gh<_i56.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i21.RegisterUseCase>(
      () => _i21.RegisterUseCase(
        repository: gh<_i57.RegisterRepositoryContract>(),
      ),
    );
    gh.factory<_i444.RegisterCubit>(
      () => _i444.RegisterCubit(gh<_i21.RegisterUseCase>()),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
