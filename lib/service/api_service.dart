import 'dart:developer';
import 'package:daccesstest/constant/apiconstant.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class ApiService extends getx.GetxService {
  final _dio = Dio();
  final _baseUrl = ApiConstant.baseUrl;

  @override
  void onInit() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log('Response: ${response.statusCode} ${response.statusMessage}');

          return handler.next(response);
        },
        onError: (error, handler) {
          // log('Error: ${error.response}');
          return handler.next(error);
        },
      ),
    );
    super.onInit();
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool? customBaseURL,
    bool? cache,
    Duration? cacheExpiry,
  }) async {
    _dio.options.baseUrl = customBaseURL ?? false ? path : _baseUrl;

    return await _dio.get(
      customBaseURL ?? false ? '' : path,
    );
    // return _dio.get(path);
  }

  Future<Response> post(
    String path,
    dynamic data, {
    bool? isCustomBaseURL,
  }) async {
    _dio.options.baseUrl = isCustomBaseURL ?? false ? path : _baseUrl;
    return await _dio.post(
      isCustomBaseURL ?? false ? '' : path,
      data: data,
    );
  }
}
