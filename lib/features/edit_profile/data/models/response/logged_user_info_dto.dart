import 'package:exam_app/features/edit_profile/data/models/response/user_dto.dart';
import 'package:exam_app/features/edit_profile/domain/entities/logged_user_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logged_user_info_dto.g.dart';


@JsonSerializable()
class LoggedUserInfoDto {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "user")
    UserDto? user;

    LoggedUserInfoDto({
        this.message,
        this.user,
    });

    factory LoggedUserInfoDto.fromJson(Map<String, dynamic> json) => _$LoggedUserInfoDtoFromJson(json);

    Map<String, dynamic> toJson() => _$LoggedUserInfoDtoToJson(this);

    LoggedUserInfoEntity toEntity() {
      return LoggedUserInfoEntity(
        message: message,
        user: user?.toEntity()
      );
    }
}


