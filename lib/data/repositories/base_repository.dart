import 'package:clean_mvvm/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/errors/api_error_handler.dart';

abstract class BaseRepository {
  // Handle API calls and maps response to [Either].
  Future<Either<Failure, T>> safeApiCall<T>(
      Future<T> Function() apiCall) async {
    try {
      final result = await apiCall();
      return Right(result);
    } on DioException catch (dioError) {
      return Left(ApiErrorHandler.handleDioError(error: dioError));
    } catch (error) {
      return Left(Failure(message: 'An unexpected error occurred.'));
    }
  }
}
