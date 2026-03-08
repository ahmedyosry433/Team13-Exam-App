import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/config/error/failures.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';

String? handleError(Exception? exception) {
  return switch (exception) {
    ServerFailure() => exception.errorMessage,
    OfflineFailures() => exception.errorMessage,
    CacheFailures() => exception.errorMessage,
    _ => LocaleKeys.error_api_failure_unexpected_error.tr(),
  };
}

bool handleNetwork(Exception? exception) {
  return switch (exception) {
    ServerFailure()
        when connectionErrorsList.contains(exception.errorMessage) =>
      true,
    NetworkFailures() => true,
    _ => false,
  };
}
