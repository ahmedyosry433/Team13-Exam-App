import 'package:exam_app/features/edit_profile/domain/entities/user_edit_profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_edit_profile_dto.g.dart';
@JsonSerializable()
class UserEditProfileDto {
    @JsonKey(name: "_id")
    String? id;
    @JsonKey(name: "username")
    String? username;
    @JsonKey(name: "firstName")
    String? firstName;
    @JsonKey(name: "lastName")
    String? lastName;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "phone")
    String? phone;
    @JsonKey(name: "role")
    String? role;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "isVerified")
    bool? isVerified;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "passwordResetCode")
    String? passwordResetCode;
    @JsonKey(name: "passwordResetExpires")
    DateTime? passwordResetExpires;
    @JsonKey(name: "resetCodeVerified")
    bool? resetCodeVerified;

    UserEditProfileDto({
        this.id,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.role,
        this.password,
        this.isVerified,
        this.createdAt,
        this.passwordResetCode,
        this.passwordResetExpires,
        this.resetCodeVerified,
    });

    factory UserEditProfileDto.fromJson(Map<String, dynamic> json) => _$UserEditProfileDtoFromJson(json);

    Map<String, dynamic> toJson() => _$UserEditProfileDtoToJson(this);
    UserEditProfileEntity toEntity() {
      return UserEditProfileEntity(
        id: id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        role: role,
        password: password,
        isVerified: isVerified,
        createdAt: createdAt,
        passwordResetCode: passwordResetCode,
        passwordResetExpires: passwordResetExpires,
        resetCodeVerified: resetCodeVerified,
      );
    }
}
