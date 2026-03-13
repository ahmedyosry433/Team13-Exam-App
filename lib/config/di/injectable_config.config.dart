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
import '../../features/auth/register/api/api_client/register_api_client.dart'
    as _i517;
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
    gh.singleton<_i781.AppInterceptors>(
      () => _i781.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i183.LoginRemoteDataSourceContract>(
      () => _i584.LoginRemoteDataSourceImpl(gh<_i32.SigninApi>()),
    );
    gh.factory<_i589.UserHelper>(
      () => _i589.UserHelper(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
