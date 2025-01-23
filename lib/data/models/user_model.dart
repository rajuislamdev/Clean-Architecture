import 'package:json_annotation/json_annotation.dart';

import '../../domain/entites/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  }) : super();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Convert to `UserEntity`
  ///
  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        email: email,
      );
}
