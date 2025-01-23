import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entites/user_entity.dart';
import '../repositories/auth_repository.dart';

class SendOtpUsecase {
  final AuthRepository authRepository;
  SendOtpUsecase({required this.authRepository});

  Future<Either<Failure, UserEntity>> call(Map<String, dynamic> credentials) =>
      authRepository.login(credentials);
}
