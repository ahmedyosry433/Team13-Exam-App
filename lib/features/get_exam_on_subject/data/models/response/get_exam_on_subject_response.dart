import 'package:exam_app/features/get_exam_on_subject/data/models/response/exam_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_exam_on_subject_response.g.dart';

GetExamOnSubjectResponse getExamOnSubjectResponseFromJson(String str) => GetExamOnSubjectResponse.fromJson(json.decode(str));

String getExamOnSubjectResponseToJson(GetExamOnSubjectResponse data) => json.encode(data.toJson());

@JsonSerializable()
class GetExamOnSubjectResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "metadata")
    Metadata? metadata;
    @JsonKey(name: "exams")
    List<ExamDto>? exams;

    GetExamOnSubjectResponse({
        this.message,
        this.metadata,
        this.exams,
    });

    factory GetExamOnSubjectResponse.fromJson(Map<String, dynamic> json) => _$GetExamOnSubjectResponseFromJson(json);

    Map<String, dynamic> toJson() => _$GetExamOnSubjectResponseToJson(this);
}


@JsonSerializable()
class Metadata {
    @JsonKey(name: "currentPage")
    int? currentPage;
    @JsonKey(name: "numberOfPages")
    int? numberOfPages;
    @JsonKey(name: "limit")
    int? limit;

    Metadata({
        this.currentPage,
        this.numberOfPages,
        this.limit,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

    Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
