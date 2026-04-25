import 'package:exam_app/config/api/api_executer.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/home/api/api_client/home_api_client.dart';
import 'package:exam_app/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:exam_app/features/home/data/models/response/subjects_respose.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  final HomeApiClient _apiClient;

  HomeRemoteDataSourceImpl(this._apiClient);
  @override
  Future<Result<SubjectsResponse>> getSubjects() async {
    return await executeApi(() async {
      final response = await _apiClient.getsubjects();
      return response;
    });
  }
}
