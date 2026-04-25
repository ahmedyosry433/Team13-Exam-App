import 'package:exam_app/features/questions/data/models/questions_model/question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questions_response_model.g.dart';

@JsonSerializable()
class QuestionsResponseModel {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'questions')
  final List<QuestionModel>? questions;

  const QuestionsResponseModel({this.message, this.questions});

  factory QuestionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseModelToJson(this);
}
