import 'package:clean_mvvm/core/errors/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState<T> with _$AppState<T> {
  const factory AppState.initial() = _Initial<T>;
  const factory AppState.loading() = _Loading<T>;
  const factory AppState.success(T data) = _Success<T>;
  const factory AppState.error(Failure failure) = _Failure<T>;
}
