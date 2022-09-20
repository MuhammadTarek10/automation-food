import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final AppPreference appPreference;
  DioFactory({required this.appPreference});

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String? token = appPreference.getToken();
    Map<String, String> headers = {
      AppConstants.cotnentType: AppConstants.applicationJson,
      AppConstants.accept: AppConstants.applicationJson,
      AppConstants.authorization: token ?? "",
    };

    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
      receiveTimeout: AppConstants.recieveTimeout,
      connectTimeout: AppConstants.connectTimeout,
      sendTimeout: AppConstants.sendTimeout,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }

    return dio;
  }
}
