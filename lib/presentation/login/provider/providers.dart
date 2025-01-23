import 'package:clean_mvvm/core/state/app_state.dart';
import 'package:clean_mvvm/data/services/api/dio_client.dart';
import 'package:clean_mvvm/domain/entites/user_entity.dart';
import 'package:clean_mvvm/domain/usecases/login_user_usecase.dart';
import 'package:clean_mvvm/presentation/login/model/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/implementations/auth_repository_impl.dart';
import '../../../data/services/auth_service.dart';
import '../../../domain/repositories/auth_repository.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(DioClient().dio);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authSerivce = ref.watch(authServiceProvider);
  return AuthRepositoryImpl(authService: authSerivce);
});

final loginUserUsecaseProvider = Provider<LoginUserUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginUserUsecase(authRepository);
});

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, AppState<UserEntity>>(
  (ref) {
    final loginUserUsecase = ref.watch(loginUserUsecaseProvider);
    return LoginViewModel(loginUserUsecase);
  },
);
