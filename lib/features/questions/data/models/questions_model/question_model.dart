import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import '../answers_model/answer_model.dart';
import '../exams_models/exam_model.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'answers')
  final List<AnswerModel>? answers;
  @JsonKey(name: 'exam')
  final ExamModel? exam;
  @JsonKey(name: 'type')
  final QuestionType? type;
  @JsonKey(name: 'question')
  final String? question;
  @JsonKey(name: 'correct')
  final String? correct;
  // @JsonKey(name: 'subject')
  // final String? subject;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  const QuestionModel({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    // this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  QuestionEntity toEntity() {
    return QuestionEntity(
      id: id,
      answers: answers?.map((answer) => answer.toEntity()).toList(),
      type: type,
      question: question,
      correct: correct,
      // subject: subject,
      exam: exam?.toEntity(),
      createdAt: createdAt,
    );
  }
}
