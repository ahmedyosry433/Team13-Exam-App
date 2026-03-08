import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/config/error/failures.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../di/injectable_config.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  if (!await getIt.get<InternetConnection>().hasInternetAccess) {
    return Error(
      exception: NetworkFailures(
        errorMessage: LocaleKeys.global_no_internet.tr(),
      ),
    );
  }
  try {
    var result = await apiCall();
    return Success<T>(data: result);
  } on DioException catch (ex) {
    return Error<T>(
      exception: ServerFailure.fromDioException(dioException: ex),
    );
  } on Exception catch (ex) {
    return Error<T>(exception: ex);
  }
}
