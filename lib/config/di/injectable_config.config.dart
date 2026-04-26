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

// import '../../core/user_helper/user_helper.dart' as _i589;
// import '../../features/auth/login/api/api_client/login_api_client.dart' as _i32;
// import '../../features/auth/login/api/data_sources/login_remote_data_source_impl.dart'
//     as _i584;
// import '../../features/auth/login/data/data_sources/login_remote_data_source_contract.dart'
//     as _i183;
// import '../../features/auth/login/data/repositories/login_repository_impl.dart'
//     as _i470;
// import '../../features/auth/login/domain/repositories/login_repository.dart'
//     as _i176;
// import '../../features/auth/login/domain/use_case/login_use_case.dart' as _i630;
// import '../../features/auth/login/presentation/view_model/cubit/login_cubit.dart'
//     as _i609;
// import '../../features/auth/register/api/api_client/register_api_client.dart'
//     as _i517;
// import '../../features/auth/register/api/data_sources/register_remote_data_source_impl.dart'
//     as _i743;
// import '../../features/auth/register/data/data_sources/register_remote_data_source_contract.dart'
//     as _i953;
// import '../../features/auth/register/data/repositories/register_repository_impl.dart'
//     as _i200;
// import '../../features/auth/register/domain/repositories/register_repository.dart'
//     as _i57;
// import '../../features/auth/register/domain/use_case/register_use_case.dart'
//     as _i21;
// import '../../features/auth/register/presentation/view_model/cubit/register_cubit.dart'
//     as _i444;
// import '../../features/edit_profile/api/api_client/edit_profile_api_client.dart'
//     as _i690;
// import '../../features/edit_profile/api/datasources/edit_profile_remote_data_source_impl.dart'
//     as _i368;
// import '../../features/edit_profile/data/datasources/edit_profile_remote_data_source_contract.dart'
//     as _i129;
// import '../../features/edit_profile/data/repositories/edit_profile_repository_impl.dart'
//     as _i337;
// import '../../features/edit_profile/domain/repositories/edit_profile_repository.dart'
//     as _i698;
// import '../../features/edit_profile/domain/use_cases/edit_profile_use_case.dart'
//     as _i406;
// import '../../features/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart'
//     as _i520;
// import '../../features/forget_password/api/api_client/forget_password_api_client.dart'
//     as _i892;
// import '../../features/forget_password/api/datasources/forget_password_remote_data_source_impl.dart'
//     as _i358;
// import '../../features/forget_password/data/datasources/forget_password_remote_data_source_contract.dart'
//     as _i913;
// import '../../features/forget_password/data/repositories/forget_password_repository_impl.dart'
//     as _i787;
// import '../../features/forget_password/domain/repositories/forget_password_repository.dart'
//     as _i129;
// import '../../features/forget_password/domain/use_cases/reset_password_use_case.dart'
//     as _i56;
// import '../../features/forget_password/domain/use_cases/send_otp_use_case.dart'
//     as _i862;
// import '../../features/forget_password/domain/use_cases/verify_reset_code_use_case.dart'
//     as _i798;
// import '../../features/forget_password/presentation/view_model/cubit/forget_password_cubit.dart'
//     as _i955;
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
// import '../../features/home/api/api_client/home_api_client.dart' as _i592;
// import '../../features/home/api/datasources/home_remote_data_source_impl.dart'
//     as _i796;
// import '../../features/home/data/datasources/home_remote_data_source_contract.dart'
//     as _i969;
// import '../../features/home/data/repositories/home_repository_impl.dart'
//     as _i76;
// import '../../features/home/domain/repositories/home_repository.dart' as _i0;
// import '../../features/home/domain/use_cases/home_use_case.dart' as _i933;
// import '../../features/home/presentation/view_model/cubit/home_cubit.dart'
//     as _i1039;
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
// import '../../features/results/api/datasources/results_local_data_source_impl.dart'
//     as _i756;
// import '../../features/results/data/datasources/results_local_data_source_contract.dart'
//     as _i294;
// import '../../features/results/data/repositories/results_repository_impl.dart'
//     as _i383;
// <<<<<<< HEAD
// =======
// import '../../features/results/domain/entities/mapper/question_isar_mapper.dart'
//     as _i14;
// import '../../features/results/domain/entities/mapper/questions_result_mapper.dart'
//     as _i222;
// >>>>>>> Features/result
// import '../../features/results/domain/repositories/results_repository_contract.dart'
//     as _i487;
// import '../../features/results/domain/use_cases/get_all_results_use_case.dart'
//     as _i474;
// import '../../features/results/domain/use_cases/save_result_use_case.dart'
//     as _i799;
// import '../../features/results/presentation/view_model/cubit/results_cubit.dart'
//     as _i10;
// import '../api/app_interceptors.dart' as _i781;
// import '../db/isar_service.dart' as _i279;
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
// <<<<<<< HEAD
//     gh.factory<_i609.LoginCubit>(() => _i609.LoginCubit());
// =======
//     gh.factory<_i14.QuestionIsarMapper>(() => _i14.QuestionIsarMapper());
// >>>>>>> Features/result
//     gh.singleton<_i279.IsarService>(() => _i279.IsarService());
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
//     gh.factory<_i32.SigninApi>(() => _i32.SigninApi(gh<_i361.Dio>()));
//     gh.factory<_i517.SignupApi>(() => _i517.SignupApi(gh<_i361.Dio>()));
//     gh.factory<_i690.EditProfileApiClient>(
//       () => _i690.EditProfileApiClient(gh<_i361.Dio>()),
//     );
//     gh.factory<_i892.ForgetPasswordApiClient>(
//       () => _i892.ForgetPasswordApiClient(gh<_i361.Dio>()),
//     );
//     gh.factory<_i26.GetExamSubjectApiClient>(
//       () => _i26.GetExamSubjectApiClient(gh<_i361.Dio>()),
//     );
//     gh.factory<_i592.HomeApiClient>(() => _i592.HomeApiClient(gh<_i361.Dio>()));
//     gh.factory<_i849.QuestionsApiClient>(
//       () => _i849.QuestionsApiClient(gh<_i361.Dio>()),
//     );
// <<<<<<< HEAD
//     gh.factory<_i183.LoginRemoteDataSourceContract>(
//       () => _i584.LoginRemoteDataSourceImpl(gh<_i32.SigninApi>()),
//     );
//     gh.factory<_i969.HomeRemoteDataSourceContract>(
//       () => _i796.HomeRemoteDataSourceImpl(gh<_i592.HomeApiClient>()),
// =======
//     gh.factory<_i222.QuestionsResultMapper>(
//       () => _i222.QuestionsResultMapper(gh<_i14.QuestionIsarMapper>()),
// >>>>>>> Features/result
//     );
//     gh.singleton<_i781.AppInterceptors>(
//       () => _i781.AppInterceptors(
//         dio: gh<_i361.Dio>(),
//         fss: gh<_i558.FlutterSecureStorage>(),
//       ),
//     );
// <<<<<<< HEAD
//     gh.factory<_i913.ForgetPasswordRemoteDataSourceContract>(
//       () => _i358.ForgetPasswordRemoteDataSourceImpl(
//         apiClient: gh<_i892.ForgetPasswordApiClient>(),
//       ),
//     );
//     gh.factory<_i188.GetExamOnSubjectRemoteDataSourceContract>(
//       () => _i791.GetExamOnSubjectRemoteDataSourceImpl(
//         gh<_i26.GetExamSubjectApiClient>(),
//       ),
//     );
//     gh.factory<_i953.RegisterRemoteDataSourceContract>(
//       () => _i743.RegisterRemoteDataSourceImpl(gh<_i517.SignupApi>()),
//     );
//     gh.factory<_i129.ForgetPasswordRepository>(
//       () => _i787.ForgetPasswordRepositoryImpl(
//         remoteDataSourceContract:
//             gh<_i913.ForgetPasswordRemoteDataSourceContract>(),
//       ),
//     );
//     gh.factory<_i129.EditProfileRemoteDataSourceContract>(
//       () => _i368.EditProfileRemoteDataSourceImpl(
//         gh<_i690.EditProfileApiClient>(),
//       ),
//     );
//     gh.factory<_i698.EditProfileRepository>(
//       () => _i337.EditProfileRepositoryImpl(
//         gh<_i129.EditProfileRemoteDataSourceContract>(),
//       ),
//     );
//     gh.factory<_i294.ResultsLocalDataSource>(
//       () => _i756.ResultsLocalDataSourceImpl(gh<_i279.IsarService>()),
//     );
//     gh.factory<_i862.SendOtpUseCase>(
//       () => _i862.SendOtpUseCase(
//         repository: gh<_i129.ForgetPasswordRepository>(),
// =======
//     gh.factory<_i294.ResultsLocalDataSource>(
//       () => _i756.ResultsLocalDataSourceImpl(
//         gh<_i279.IsarService>(),
//         gh<_i222.QuestionsResultMapper>(),
// >>>>>>> Features/result
//       ),
//     );
//     gh.factory<_i589.UserHelper>(
//       () => _i589.UserHelper(
//         gh<_i460.SharedPreferences>(),
//         gh<_i558.FlutterSecureStorage>(),
//       ),
//     );
//     gh.factory<_i406.EditProfileUseCase>(
//       () => _i406.EditProfileUseCase(gh<_i698.EditProfileRepository>()),
//     );
//     gh.factory<_i0.HomeRepository>(
//       () => _i76.HomeRepositoryImpl(
//         dataSourceContract: gh<_i969.HomeRemoteDataSourceContract>(),
//       ),
//     );
//     gh.factory<_i933.HomeUseCase>(
//       () => _i933.HomeUseCase(homeRepository: gh<_i0.HomeRepository>()),
//     );
//     gh.factory<_i4.QuestionsRemoteDataSourceContract>(
//       () => _i450.QuestionsRemoteDataSourceImpl(gh<_i849.QuestionsApiClient>()),
//     );
// <<<<<<< HEAD
//     gh.factory<_i176.LoginRepositoryContract>(
//       () =>
//           _i470.LoginRepositoryImpl(gh<_i183.LoginRemoteDataSourceContract>()),
//     );
//     gh.factory<_i630.LoginUseCase>(
//       () => _i630.LoginUseCase(repository: gh<_i176.LoginRepositoryContract>()),
//     );
//     gh.factory<_i1039.HomeCubit>(
//       () => _i1039.HomeCubit(gh<_i933.HomeUseCase>()),
//     );
//     gh.factory<_i963.GetExamOnSubjectRepository>(
//       () => _i498.GetExamOnSubjectRepositoryImpl(
//         gh<_i188.GetExamOnSubjectRemoteDataSourceContract>(),
//       ),
//     );
//     gh.factory<_i57.RegisterRepositoryContract>(
//       () => _i200.RegisterRepositoryImpl(
//         gh<_i953.RegisterRemoteDataSourceContract>(),
//       ),
//     );
//     gh.factory<_i56.ResetPasswordUseCase>(
//       () => _i56.ResetPasswordUseCase(gh<_i129.ForgetPasswordRepository>()),
//     );
//     gh.factory<_i798.VerifyResetCodeUseCase>(
//       () => _i798.VerifyResetCodeUseCase(gh<_i129.ForgetPasswordRepository>()),
//     );
//     gh.factory<_i487.ResultsRepositoryContract>(
//       () => _i383.ResultsRepositoryImpl(gh<_i294.ResultsLocalDataSource>()),
//     );
//     gh.factory<_i955.ForgetPasswordCubit>(
//       () => _i955.ForgetPasswordCubit(
//         gh<_i862.SendOtpUseCase>(),
//         gh<_i798.VerifyResetCodeUseCase>(),
//         gh<_i56.ResetPasswordUseCase>(),
//       ),
// =======
//     gh.factory<_i487.ResultsRepositoryContract>(
//       () => _i383.ResultsRepositoryImpl(gh<_i294.ResultsLocalDataSource>()),
// >>>>>>> Features/result
//     );
//     gh.factory<_i358.QuestionsRepositoryContract>(
//       () => _i416.QuestionsRepositoryImpl(
//         gh<_i4.QuestionsRemoteDataSourceContract>(),
//       ),
//     );
// <<<<<<< HEAD
//     gh.factory<_i520.EditProfileCubit>(
//       () => _i520.EditProfileCubit(gh<_i406.EditProfileUseCase>()),
//     );
//     gh.factory<_i21.RegisterUseCase>(
//       () => _i21.RegisterUseCase(
//         repository: gh<_i57.RegisterRepositoryContract>(),
//       ),
//     );
//     gh.factory<_i266.GetExamOnSubjectUseCase>(
//       () =>
//           _i266.GetExamOnSubjectUseCase(gh<_i963.GetExamOnSubjectRepository>()),
//     );
// =======
// >>>>>>> Features/result
//     gh.factory<_i216.GetQuestionsByExamIdUseCase>(
//       () => _i216.GetQuestionsByExamIdUseCase(
//         gh<_i358.QuestionsRepositoryContract>(),
//       ),
//     );
//     gh.factory<_i474.GetAllResultsUseCase>(
//       () => _i474.GetAllResultsUseCase(gh<_i487.ResultsRepositoryContract>()),
//     );
//     gh.factory<_i799.SaveResultUseCase>(
//       () => _i799.SaveResultUseCase(gh<_i487.ResultsRepositoryContract>()),
//     );
// <<<<<<< HEAD
//     gh.factory<_i444.RegisterCubit>(
//       () => _i444.RegisterCubit(gh<_i21.RegisterUseCase>()),
//     );
// =======
// >>>>>>> Features/result
//     gh.factory<_i875.QuestionsCubit>(
//       () => _i875.QuestionsCubit(
//         gh<_i216.GetQuestionsByExamIdUseCase>(),
//         gh<_i799.SaveResultUseCase>(),
//       ),
//     );
// <<<<<<< HEAD
//     gh.factory<_i1027.GetExamOnSubjectCubit>(
//       () => _i1027.GetExamOnSubjectCubit(gh<_i266.GetExamOnSubjectUseCase>()),
//     );
// =======
// >>>>>>> Features/result
//     gh.factory<_i10.ResultsCubit>(
//       () => _i10.ResultsCubit(gh<_i474.GetAllResultsUseCase>()),
//     );
//     return this;
//   }
// }

// class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
