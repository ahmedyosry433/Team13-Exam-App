// TODO: data QuestionsRepositoryImpl

import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/questions/data/datasources/questions_remote_data_source_contract.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/questions/domain/repositories/questions_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionsRepositoryContract)
class QuestionsRepositoryImpl implements QuestionsRepositoryContract {
  final QuestionsRemoteDataSourceContract _remoteDataSourceContract;
  const QuestionsRepositoryImpl(this._remoteDataSourceContract);
  @override
  Future<Result<List<QuestionEntity>>> getQuestions(String examId) async {
    final result = await _remoteDataSourceContract.getQuestions(examId);
    return result.when(
      success: (questions) {
        List<QuestionEntity> questionsList =
            questions?.map((question) {
              return question.toEntity();
            }).toList() ??
            [];
        return Success<List<QuestionEntity>>(data: questionsList);
      },
      error: (error) {
        return Error(exception: error);
      },
    );
  }
}
