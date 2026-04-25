import 'package:exam_app/features/questions/domain/entities/answer_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_model.g.dart';

@JsonSerializable()
class AnswerModel {
  @JsonKey(name: 'answer')
  final String? answer;
  @JsonKey(name: 'key')
  final String? answerKey;

  const AnswerModel({this.answer, this.answerKey});

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);

  AnswerEntity toEntity() {
    return AnswerEntity(answer: answer, answerKey: answerKey);
  }
}
