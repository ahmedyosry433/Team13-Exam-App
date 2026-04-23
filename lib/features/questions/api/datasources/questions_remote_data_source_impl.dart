// TODO: api QuestionsRemoteDataSourceImpl

import 'package:exam_app/config/api/api_executer.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/questions/api/api_client/questions_api_client.dart';
import 'package:exam_app/features/questions/data/datasources/questions_remote_data_source_contract.dart';
import 'package:exam_app/features/questions/data/models/questions_model/question_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionsRemoteDataSourceContract)
class QuestionsRemoteDataSourceImpl
    implements QuestionsRemoteDataSourceContract {
  final QuestionsApiClient _apiClient;
  const QuestionsRemoteDataSourceImpl(this._apiClient);
  @override
  Future<Result<List<QuestionModel>>> getQuestions(String examId) async {
    return await executeApi(() async {
      final response = await _apiClient.getQuestions(examId);
      return response.questions ?? [];
    });
  }
}
