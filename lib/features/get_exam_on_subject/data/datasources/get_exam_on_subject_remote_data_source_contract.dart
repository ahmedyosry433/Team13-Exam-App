
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/get_exam_on_subject/data/models/response/get_exam_on_subject_response.dart';

abstract class GetExamOnSubjectRemoteDataSourceContract {
  Future<Result<GetExamOnSubjectResponse>> getExamOnSubject({
    required String subjectId,
  });
}