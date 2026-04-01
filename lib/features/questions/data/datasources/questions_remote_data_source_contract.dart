// TODO: data QuestionsRemoteDataSourceContract

import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/questions/data/models/questions_model/question_model.dart';

abstract class QuestionsRemoteDataSourceContract {
  Future<Result<List<QuestionModel>>> getQuestions(String examId);
}
