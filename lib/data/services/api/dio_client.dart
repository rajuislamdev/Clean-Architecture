import 'package:clean_mvvm/core/config/environment.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'dio_interceptors.dart';

// Dio client setup
final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl))
  ..interceptors.add(DioInterceptors());

// Initialize Retrofit
final client = RestClient(dio);

// Retrofit client class (you can call your APIs here)
@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
}
