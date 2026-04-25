// // GENERATED CODE - DO NOT MODIFY BY HAND
// // dart format width=80

// // **************************************************************************
// // InjectableConfigGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:dio/dio.dart' as _i361;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
// import 'package:get_it/get_it.dart' as _i174;
// import 'package:injectable/injectable.dart' as _i526;
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
//     as _i161;
// import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/user_helper/user_helper.dart' as _i589;
import '../../features/home/api/api_client/home_api_client.dart' as _i592;
import '../../features/home/api/datasources/home_remote_data_source_impl.dart'
    as _i796;
import '../../features/home/data/datasources/home_remote_data_source_contract.dart'
    as _i969;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/domain/use_cases/home_use_case.dart' as _i933;
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
    gh.factory<_i592.HomeApiClient>(() => _i592.HomeApiClient(gh<_i361.Dio>()));
    gh.factory<_i969.HomeRemoteDataSourceContract>(
      () => _i796.HomeRemoteDataSourceImpl(gh<_i592.HomeApiClient>()),
    );
    gh.singleton<_i781.AppInterceptors>(
      () => _i781.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i589.UserHelper>(
      () => _i589.UserHelper(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i0.HomeRepository>(
      () => _i76.HomeRepositoryImpl(
        dataSourceContract: gh<_i969.HomeRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i933.HomeUseCase>(
      () => _i933.HomeUseCase(homeRepository: gh<_i0.HomeRepository>()),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
// import '../../core/user_helper/user_helper.dart' as _i589;
// <<<<<<< HEAD
// import '../../features/questions/api/api_client/questions_api_client.dart'
//     as _i849;
// import '../../features/questions/api/datasources/questions_remote_data_source_impl.dart'
//     as _i450;
// import '../../features/questions/data/datasources/questions_remote_data_source_contract.dart'
//     as _i4;
// import '../../features/questions/data/repositories/questions_repository_impl.dart'
//     as _i416;
// import '../../features/questions/domain/repositories/questions_repository.dart'
//     as _i358;
// import '../../features/questions/domain/use_cases/get_questions_by_exam_id_use_case.dart'
//     as _i216;
// import '../../features/questions/presentation/view_model/cubit/questions_cubit.dart'
//     as _i875;
// =======
// import '../../features/get_exam_on_subject/api/api_client/get_exam_on_subject_api_client.dart'
//     as _i26;
// import '../../features/get_exam_on_subject/api/datasources/get_exam_on_subject_remote_data_source_impl.dart'
//     as _i791;
// import '../../features/get_exam_on_subject/data/datasources/get_exam_on_subject_remote_data_source_contract.dart'
//     as _i188;
// import '../../features/get_exam_on_subject/data/repositories/get_exam_on_subject_repository_impl.dart'
//     as _i498;
// import '../../features/get_exam_on_subject/domain/repositories/get_exam_on_subject_repository.dart'
//     as _i963;
// import '../../features/get_exam_on_subject/domain/use_cases/get_exam_on_subject_use_case.dart'
//     as _i266;
// import '../../features/get_exam_on_subject/presentation/view_model/cubit/get_exam_on_subject_cubit.dart'
//     as _i1027;
// >>>>>>> feature/get_exam_on_subject
// import '../api/app_interceptors.dart' as _i781;
// import 'register_module.dart' as _i291;

// extension GetItInjectableX on _i174.GetIt {
//   // initializes the registration of main-scope dependencies inside of GetIt
//   Future<_i174.GetIt> init({
//     String? environment,
//     _i526.EnvironmentFilter? environmentFilter,
//   }) async {
//     final gh = _i526.GetItHelper(this, environment, environmentFilter);
//     final coreInjectableModule = _$CoreInjectableModule();
//     await gh.factoryAsync<_i460.SharedPreferences>(
//       () => coreInjectableModule.prefs(),
//       preResolve: true,
//     );
//     gh.singleton<_i361.Dio>(() => coreInjectableModule.dio());
//     gh.lazySingleton<_i558.FlutterSecureStorage>(
//       () => coreInjectableModule.secureStorage(),
//     );
//     gh.lazySingleton<_i361.CancelToken>(
//       () => coreInjectableModule.cancelToken(),
//     );
//     gh.lazySingleton<_i161.InternetConnection>(
//       () => coreInjectableModule.internetConnection(),
//     );
// <<<<<<< HEAD
//     gh.factory<_i849.QuestionsApiClient>(
//       () => _i849.QuestionsApiClient(gh<_i361.Dio>()),
// =======
//     gh.factory<_i26.GetExamSubjectApiClient>(
//       () => _i26.GetExamSubjectApiClient(gh<_i361.Dio>()),
// >>>>>>> feature/get_exam_on_subject
//     );
//     gh.singleton<_i781.AppInterceptors>(
//       () => _i781.AppInterceptors(
//         dio: gh<_i361.Dio>(),
//         fss: gh<_i558.FlutterSecureStorage>(),
//       ),
//     );
//     gh.factory<_i188.GetExamOnSubjectRemoteDataSourceContract>(
//       () => _i791.GetExamOnSubjectRemoteDataSourceImpl(
//         gh<_i26.GetExamSubjectApiClient>(),
//       ),
//     );
//     gh.factory<_i589.UserHelper>(
//       () => _i589.UserHelper(
//         gh<_i460.SharedPreferences>(),
//         gh<_i558.FlutterSecureStorage>(),
//       ),
//     );
// <<<<<<< HEAD
//     gh.factory<_i4.QuestionsRemoteDataSourceContract>(
//       () => _i450.QuestionsRemoteDataSourceImpl(gh<_i849.QuestionsApiClient>()),
//     );
//     gh.factory<_i358.QuestionsRepositoryContract>(
//       () => _i416.QuestionsRepositoryImpl(
//         gh<_i4.QuestionsRemoteDataSourceContract>(),
//       ),
//     );
//     gh.factory<_i216.GetQuestionsByExamIdUseCase>(
//       () => _i216.GetQuestionsByExamIdUseCase(
//         gh<_i358.QuestionsRepositoryContract>(),
//       ),
//     );
//     gh.factory<_i875.QuestionsCubit>(
//       () => _i875.QuestionsCubit(gh<_i216.GetQuestionsByExamIdUseCase>()),
// =======
//     gh.factory<_i963.GetExamOnSubjectRepository>(
//       () => _i498.GetExamOnSubjectRepositoryImpl(
//         gh<_i188.GetExamOnSubjectRemoteDataSourceContract>(),
//       ),
//     );
//     gh.factory<_i266.GetExamOnSubjectUseCase>(
//       () =>
//           _i266.GetExamOnSubjectUseCase(gh<_i963.GetExamOnSubjectRepository>()),
//     );
//     gh.factory<_i1027.GetExamOnSubjectCubit>(
//       () => _i1027.GetExamOnSubjectCubit(gh<_i266.GetExamOnSubjectUseCase>()),
// >>>>>>> feature/get_exam_on_subject
//     );
//     return this;
//   }
// }

// class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
