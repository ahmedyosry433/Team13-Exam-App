import 'package:dio/dio.dart';
import 'package:exam_app/config/api/api_keys.dart';
import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/user_helper/user_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'status_code.dart';
// الكلاس ده بيعمل  بيضيف التوكين تلقائى فكل ريكويست  وكمان لو صلاحسة التوكين خلصت  بيعمل لوج اوت تلقائى كمان بيلغى الريكويست لو حصل مشكلة

@singleton
class AppInterceptors extends Interceptor {
  final Dio dio;
  final FlutterSecureStorage fss;

  AppInterceptors({required this.dio, required this.fss});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.cancelToken = getIt<CancelToken>();
    String? authToken = await fss.read(key: Apikeys.token);
    if (authToken != null && authToken.isNotEmpty) {
      // authToken =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZTEyZjViMDRkYTBkNGNmNTU2YTdlOSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc2MzY1NDAzfQ.uXt2mGOY2_l1Xzk-wAbLQ6IzzxDkyVwuYLiwpQRnA2k";
      options.headers[Apikeys.token] = authToken;
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ToDo
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint("err.response?.statusCode ${err.response?.statusCode}");
    if (err.response?.statusCode == StatusCode.expiredToken) {
      getIt.get<UserHelper>().clearUserData();
    }
    super.onError(err, handler);
  }
}
