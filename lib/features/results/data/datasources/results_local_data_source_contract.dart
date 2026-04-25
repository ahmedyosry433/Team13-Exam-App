import 'package:exam_app/features/results/data/models/exam_result_collection.dart';

abstract class ResultsLocalDataSource {
  Future<void> saveExamResult(ExamResultCollection result);
  Future<List<ExamResultCollection>> getAllExamResults();
}
