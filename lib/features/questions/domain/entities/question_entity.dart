import 'package:equatable/equatable.dart';
import 'answer_entity.dart';
import 'exam_entity.dart';

class QuestionEntity extends Equatable {
  final List<AnswerEntity>? answers;
  final String? type;
  final String? id;
  final String? question;
  final String? correct;
  final String? subject;
  final ExamEntity? exam;
  final DateTime? createdAt;

  const QuestionEntity({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    answers,
    type,
    id,
    question,
    correct,
    subject,
    exam,
    createdAt,
  ];
}
