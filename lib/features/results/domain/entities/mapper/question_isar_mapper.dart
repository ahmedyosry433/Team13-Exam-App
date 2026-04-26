import 'package:exam_app/features/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/questions/domain/entities/exam_entity.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/results/data/models/question_isar.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuestionIsarMapper {
  QuestionEntity toEntity(QuestionIsar isar) {
    return QuestionEntity(
      id: isar.questionId,
      question: isar.questionText,
      correct: isar.correct,
      subject: isar.subject,
      type: _typeFromString(isar.type),
      answers: isar.answers?.map(_answerToEntity).toList(),
      exam: isar.exam != null ? _examToEntity(isar.exam!) : null,
      createdAt: isar.createdAt,
    );
  }

  QuestionIsar fromEntity(QuestionEntity entity) {
    return QuestionIsar()
      ..questionId = entity.id
      ..questionText = entity.question
      ..correct = entity.correct
      ..subject = entity.subject
      ..type = _typeToString(entity.type)
      ..answers = entity.answers?.map(_answerFromEntity).toList()
      ..exam = entity.exam != null ? _examFromEntity(entity.exam!) : null
      ..createdAt = entity.createdAt;
  }

  AnswerEntity _answerToEntity(AnswerIsar isar) =>
      AnswerEntity(answer: isar.answer, answerKey: isar.answerKey);

  AnswerIsar _answerFromEntity(AnswerEntity entity) => AnswerIsar()
    ..answer = entity.answer
    ..answerKey = entity.answerKey;

  ExamEntity _examToEntity(ExamIsar isar) {
    return ExamEntity(
      id: isar.examId,
      title: isar.title,
      duration: isar.duration,
      subject: isar.subject,
      numberOfQuestions: isar.numberOfQuestions,
      active: isar.active,
      createdAt: isar.createdAt,
    );
  }

  ExamIsar _examFromEntity(ExamEntity entity) {
    return ExamIsar()
      ..examId = entity.id
      ..title = entity.title
      ..duration = entity.duration
      ..subject = entity.subject
      ..numberOfQuestions = entity.numberOfQuestions
      ..active = entity.active
      ..createdAt = entity.createdAt;
  }

  QuestionType? _typeFromString(String? value) {
    switch (value) {
      case 'multi':
        return QuestionType.multi;
      case 'single_choice':
        return QuestionType.singleChoice;
      default:
        return null;
    }
  }

  String? _typeToString(QuestionType? type) {
    switch (type) {
      case QuestionType.multi:
        return 'multi';
      case QuestionType.singleChoice:
        return 'single_choice';
      default:
        return null;
    }
  }
}
