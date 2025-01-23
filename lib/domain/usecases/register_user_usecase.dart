import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entites/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUserUsecase {
  final AuthRepository authRepository;

  RegisterUserUsecase(this.authRepository);
  Future<Either<Failure, UserEntity>> call(Map<String, dynamic> userDetails) =>
      authRepository.register(userDetails);
}
