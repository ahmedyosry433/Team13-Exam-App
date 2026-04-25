import 'package:exam_app/config/api/api_executer.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/get_exam_on_subject/api/api_client/get_exam_on_subject_api_client.dart';
import 'package:exam_app/features/get_exam_on_subject/data/datasources/get_exam_on_subject_remote_data_source_contract.dart';
import 'package:exam_app/features/get_exam_on_subject/data/models/response/get_exam_on_subject_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetExamOnSubjectRemoteDataSourceContract)
class GetExamOnSubjectRemoteDataSourceImpl
    implements GetExamOnSubjectRemoteDataSourceContract {
  final GetExamSubjectApiClient _apiClient;
  GetExamOnSubjectRemoteDataSourceImpl(this._apiClient);
  @override
  Future<Result<GetExamOnSubjectResponse>> getExamOnSubject({
    required String subjectId,
  }) async {
    return await executeApi(() async {
      final response = await _apiClient.getExamOnSubject(subjectId);
      return response;
    });
  }
}
