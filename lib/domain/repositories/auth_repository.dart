import 'package:clean_mvvm/core/errors/failure.dart';
import 'package:clean_mvvm/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(Map<String, dynamic> credentials);

  Future<Either<Failure, UserEntity>> register(
      Map<String, dynamic> credentials);

  Future<Either<Failure, UserEntity>> logout();
}
