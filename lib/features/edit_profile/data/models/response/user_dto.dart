import 'package:exam_app/features/edit_profile/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';
@JsonSerializable()
class UserDto {
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

    UserDto({
        this.id,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.role,
        this.isVerified,
        this.createdAt,
        this.passwordResetCode,
        this.passwordResetExpires,
        this.resetCodeVerified,
    });

    factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

    Map<String, dynamic> toJson() => _$UserDtoToJson(this);
    UserEntity toEntity() {
      return UserEntity(
        id: id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phone,
        role: role,
        isVerified: isVerified,
        createdAt: createdAt,
        passwordResetCode: passwordResetCode,
        passwordResetExpires: passwordResetExpires,
        resetCodeVerified: resetCodeVerified,
      );
    }
}