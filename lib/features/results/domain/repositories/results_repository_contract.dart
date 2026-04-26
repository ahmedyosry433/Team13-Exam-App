import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';

abstract class ResultsRepositoryContract {
  Future<Result<void>> saveExamResult(QuestionsResult result);
  Future<Result<List<QuestionsResult>>> getAllExamResults();
}
