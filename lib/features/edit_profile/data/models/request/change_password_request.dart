import 'package:exam_app/features/edit_profile/domain/entities/change_password_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';


@JsonSerializable()
class ChangePasswordRequest {
  @JsonKey(name: "oldPassword")
  String? oldPassword;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "rePassword")
  String? rePassword;

  ChangePasswordRequest({this.oldPassword, this.password, this.rePassword});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  ChangePasswordRequestEntity toEntity() => ChangePasswordRequestEntity(
    oldPassword: oldPassword,
    password: password,
    rePassword: rePassword,
  );
}
