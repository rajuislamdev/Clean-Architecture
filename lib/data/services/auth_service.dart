import 'package:clean_mvvm/data/models/api_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST("auth/login")
  Future<ApiResponse> login(@Body() Map<String, dynamic> credentials);

  @POST("auth/register")
  Future<ApiResponse> register(@Body() Map<String, dynamic> userDetails);

  @POST("auth/logout")
  Future<ApiResponse> logout();
}
