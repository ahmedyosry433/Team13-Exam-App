import 'package:exam_app/features/edit_profile/domain/entities/edit_profile_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequest {
  @JsonKey(name: "lastName")
  String? lastName;

  EditProfileRequest({this.lastName});

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);
  EditProfileRequestEntity toEntity() {
    return EditProfileRequestEntity(lastName: lastName);
  }
}
