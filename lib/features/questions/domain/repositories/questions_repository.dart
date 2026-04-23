// TODO: domain QuestionsRepository
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';

abstract class QuestionsRepositoryContract {
  Future<Result<List<QuestionEntity>>> getQuestions(String examId);
}
