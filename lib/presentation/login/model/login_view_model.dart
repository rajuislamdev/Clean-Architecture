import 'package:clean_mvvm/core/state/app_state.dart';
import 'package:clean_mvvm/domain/entites/user_entity.dart';
import 'package:clean_mvvm/domain/usecases/login_user_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<AppState<UserEntity>> {
  final LoginUserUsecase loginUserUsecase;

  LoginViewModel(this.loginUserUsecase) : super(const AppState.initial());

  Future<void> loginUser(Map<String, dynamic> credentials) async {
    state = const AppState.loading();
    final result = await loginUserUsecase.call(credentials);
    state = result.fold(
      (failure) => AppState.error(failure),
      (user) => AppState.success(user),
    );
  }
}
