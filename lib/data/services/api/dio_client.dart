import 'package:clean_mvvm/core/config/environment.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/api_error_handler.dart';
import 'dio_interceptors.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  final Dio dio;
  factory DioClient() => _instance;

  DioClient._internal()
      : dio = Dio(
          BaseOptions(baseUrl: Environment.apiUrl),
        )
          ..interceptors.add(DioInterceptors())
          ..interceptors.add(InterceptorsWrapper(
            onError: (error, handler) {
              // Use ApiErrorHandler to handle the error
              final failure = ApiErrorHandler.handleDioError(error: error);
              // You can log the failure or handle it further if needed
              return handler.reject(DioException(
                requestOptions: error.requestOptions,
                error: failure,
                type: DioExceptionType.unknown,
              ));
            },
          ))
          ..interceptors.add(
            LogInterceptor(
              requestBody: true,
              responseBody: true,
            ),
          );
}
