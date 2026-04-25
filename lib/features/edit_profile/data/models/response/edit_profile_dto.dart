import 'package:exam_app/features/edit_profile/data/models/response/user_edit_profile_dto.dart';
import 'package:exam_app/features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_dto.g.dart';


@JsonSerializable()
class EditProfileDto {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "user")
    UserEditProfileDto? user;

    EditProfileDto({
        this.message,
        this.user,
    });

    factory EditProfileDto.fromJson(Map<String, dynamic> json) => _$EditProfileDtoFromJson(json);

    Map<String, dynamic> toJson() => _$EditProfileDtoToJson(this);
    EditProfileEntity toEntity() {
      return EditProfileEntity(
        message: message,
        user: user?.toEntity(),
      );
    }
}

