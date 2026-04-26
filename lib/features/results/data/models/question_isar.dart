import 'package:isar_community/isar.dart';

part 'question_isar.g.dart';

@embedded
class QuestionIsar {
  String? questionId;
  String? questionText;
  String? correct;
  String? subject;
  String? type;
  List<AnswerIsar>? answers;
  ExamIsar? exam;
  DateTime? createdAt;
}

@embedded
class AnswerIsar {
  String? answer;
  String? answerKey;
}

@embedded
class ExamIsar {
  String? examId;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  DateTime? createdAt;
}
