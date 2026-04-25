import 'package:isar_community/isar.dart';

part 'exam_result_collection.g.dart';

@collection
class ExamResultCollection {
  Id id = Isar.autoIncrement;

  int? correctCount;
  int? incorrectCount;
  double? scorePercentage;

  String? questionsJson;
  String? selectedAnswersJson;

  DateTime? createdAt;
}
