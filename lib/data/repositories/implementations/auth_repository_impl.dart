import 'package:clean_mvvm/core/errors/failure.dart';
import 'package:clean_mvvm/data/repositories/base_repository.dart';
import 'package:clean_mvvm/data/services/auth_service.dart';
import 'package:clean_mvvm/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/repositories/auth_repository.dart';
import '../../models/user_model.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl({required this.authService});

  @override
  Future<Either<Failure, UserEntity>> login(
      Map<String, dynamic> credentials) async {
    return safeApiCall(() async {
      final response = await authService.login(credentials);
      final userModel = UserModel.fromJson(response.data);
      return userModel.toEntity();
    });
  }

  @override
  Future<Either<Failure, UserEntity>> register(
      Map<String, dynamic> credentials) async {
    return safeApiCall(() async {
      final response = await authService.register(credentials);
      final userModel = UserModel.fromJson(response.data);
      return userModel.toEntity();
    });
  }

  @override
  Future<Either<Failure, UserEntity>> logout() async {
    return safeApiCall(() async {
      final response = await authService.logout();
      final userModel = UserModel.fromJson(response.data);
      return userModel.toEntity();
    });
  }
}
