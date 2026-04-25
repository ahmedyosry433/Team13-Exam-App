import 'package:exam_app/features/home/data/models/response/subjects_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'subjects_respose.g.dart';

SubjectsResponse subjectsResposeFromJson(String str) =>
    SubjectsResponse.fromJson(json.decode(str));

String subjectsResposeToJson(SubjectsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SubjectsResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "subjects")
  List<SubjectsDto>? subjects;

  SubjectsResponse({this.message, this.metadata, this.subjects});

  factory SubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  int? currentPage;
  @JsonKey(name: "numberOfPages")
  int? numberOfPages;
  @JsonKey(name: "limit")
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
