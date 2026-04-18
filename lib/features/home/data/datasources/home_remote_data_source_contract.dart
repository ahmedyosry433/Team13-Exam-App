import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/home/data/models/response/subjects_respose.dart';

abstract class HomeRemoteDataSourceContract {
  Future<Result<SubjectsResponse>> getSubjects();
}
