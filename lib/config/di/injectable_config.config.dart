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
import '../../features/questions/api/api_client/questions_api_client.dart'
    as _i849;
import '../../features/questions/api/datasources/questions_remote_data_source_impl.dart'
    as _i450;
import '../../features/questions/data/datasources/questions_remote_data_source_contract.dart'
    as _i4;
import '../../features/questions/data/repositories/questions_repository_impl.dart'
    as _i416;
import '../../features/questions/domain/repositories/questions_repository.dart'
    as _i358;
import '../../features/questions/domain/use_cases/get_questions_by_exam_id_use_case.dart'
    as _i216;
import '../../features/questions/presentation/view_model/cubit/questions_cubit.dart'
    as _i875;
import '../../features/results/api/datasources/results_local_data_source_impl.dart'
    as _i756;
import '../../features/results/data/datasources/results_local_data_source_contract.dart'
    as _i294;
import '../../features/results/data/repositories/results_repository_impl.dart'
    as _i383;
import '../../features/results/domain/entities/mapper/question_isar_mapper.dart'
    as _i14;
import '../../features/results/domain/entities/mapper/questions_result_mapper.dart'
    as _i222;
import '../../features/results/domain/repositories/results_repository_contract.dart'
    as _i487;
import '../../features/results/domain/use_cases/get_all_results_use_case.dart'
    as _i474;
import '../../features/results/domain/use_cases/save_result_use_case.dart'
    as _i799;
import '../../features/results/presentation/view_model/cubit/results_cubit.dart'
    as _i10;
import '../api/app_interceptors.dart' as _i781;
import '../db/isar_service.dart' as _i279;
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
    gh.factory<_i14.QuestionIsarMapper>(() => _i14.QuestionIsarMapper());
    gh.singleton<_i279.IsarService>(() => _i279.IsarService());
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
    gh.factory<_i849.QuestionsApiClient>(
      () => _i849.QuestionsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i222.QuestionsResultMapper>(
      () => _i222.QuestionsResultMapper(gh<_i14.QuestionIsarMapper>()),
    );
    gh.singleton<_i781.AppInterceptors>(
      () => _i781.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i294.ResultsLocalDataSource>(
      () => _i756.ResultsLocalDataSourceImpl(
        gh<_i279.IsarService>(),
        gh<_i222.QuestionsResultMapper>(),
      ),
    );
    gh.factory<_i589.UserHelper>(
      () => _i589.UserHelper(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i4.QuestionsRemoteDataSourceContract>(
      () => _i450.QuestionsRemoteDataSourceImpl(gh<_i849.QuestionsApiClient>()),
    );
    gh.factory<_i487.ResultsRepositoryContract>(
      () => _i383.ResultsRepositoryImpl(gh<_i294.ResultsLocalDataSource>()),
    );
    gh.factory<_i358.QuestionsRepositoryContract>(
      () => _i416.QuestionsRepositoryImpl(
        gh<_i4.QuestionsRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i216.GetQuestionsByExamIdUseCase>(
      () => _i216.GetQuestionsByExamIdUseCase(
        gh<_i358.QuestionsRepositoryContract>(),
      ),
    );
    gh.factory<_i474.GetAllResultsUseCase>(
      () => _i474.GetAllResultsUseCase(gh<_i487.ResultsRepositoryContract>()),
    );
    gh.factory<_i799.SaveResultUseCase>(
      () => _i799.SaveResultUseCase(gh<_i487.ResultsRepositoryContract>()),
    );
    gh.factory<_i875.QuestionsCubit>(
      () => _i875.QuestionsCubit(
        gh<_i216.GetQuestionsByExamIdUseCase>(),
        gh<_i799.SaveResultUseCase>(),
      ),
    );
    gh.factory<_i10.ResultsCubit>(
      () => _i10.ResultsCubit(gh<_i474.GetAllResultsUseCase>()),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
