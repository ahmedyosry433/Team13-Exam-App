import 'package:exam_app/features/edit_profile/domain/entities/change_password_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_dto.g.dart';

@JsonSerializable()
class ChangePasswordDto {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;

  ChangePasswordDto({this.message, this.token});

  factory ChangePasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordDtoToJson(this);
  ChangePasswordEntity toEntity() {
    return ChangePasswordEntity(message: message, token: token);
  }
}
