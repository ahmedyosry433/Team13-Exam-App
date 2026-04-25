import 'package:exam_app/features/home/domain/entities/subjects_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subjects_dto.g.dart';

@JsonSerializable()
class SubjectsDto {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "icon")
  String? icon;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  SubjectsDto({this.id, this.name, this.icon, this.createdAt});
  SubjectsEntity toEntity() =>
      SubjectsEntity(id: id, name: name, icon: icon, createdAt: createdAt);

  factory SubjectsDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsDtoToJson(this);
}
