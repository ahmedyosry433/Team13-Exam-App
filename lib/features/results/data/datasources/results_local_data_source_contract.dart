import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';

abstract class ResultsLocalDataSource {
  Future<void> saveExamResult(QuestionsResult result);
  Future<List<QuestionsResult>> getAllExamResults();
}
