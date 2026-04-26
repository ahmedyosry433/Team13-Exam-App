import 'package:isar_community/isar.dart';
import 'question_isar.dart';

part 'exam_result_collection.g.dart';

@collection
class ExamResultCollection {
  Id id = Isar.autoIncrement;

  int? correctCount;
  int? incorrectCount;
  double? scorePercentage;
  int? durationMinutes;
  int? totalQuestions;
  int? takenDurationMinutes;
  DateTime? createdAt;

  List<QuestionIsar>? questions;
  List<SelectedAnswerIsar>? selectedAnswers;
}

@embedded
class SelectedAnswerIsar {
  int? questionIndex;
  List<String>? selectedKeys;

  SelectedAnswerIsar({this.questionIndex, this.selectedKeys});
}
