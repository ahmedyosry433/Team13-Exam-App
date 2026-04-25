import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/questions/domain/repositories/questions_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionsByExamIdUseCase {
  final QuestionsRepositoryContract _repositoryContract;
  const GetQuestionsByExamIdUseCase(this._repositoryContract);
  Future<Result<List<QuestionEntity>>> call(String examId) async {
    return await _repositoryContract.getQuestions(examId);
  }
}
