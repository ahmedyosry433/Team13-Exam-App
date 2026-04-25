import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/get_exam_on_subject/domain/entities/get_exam_on_subject_entities.dart';

abstract class GetExamOnSubjectRepository {
  Future<Result<List<GetExamOnSubjectEntity>>> getExamOnSubject({
    required String subjectId,
  });
}
