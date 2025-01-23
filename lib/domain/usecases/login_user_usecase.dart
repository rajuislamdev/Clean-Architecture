import 'package:clean_mvvm/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entites/user_entity.dart';

class LoginUserUsecase {
  final AuthRepository authRepository;

  LoginUserUsecase(this.authRepository);

  Future<Either<Failure, UserEntity>> call(Map<String, dynamic> credentials) =>
      authRepository.login(credentials);
}
