import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/get_exam_on_subject/domain/entities/get_exam_on_subject_entities.dart';
import 'package:exam_app/features/get_exam_on_subject/domain/repositories/get_exam_on_subject_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamOnSubjectUseCase {
  final GetExamOnSubjectRepository getExamRepository;

  const GetExamOnSubjectUseCase(this.getExamRepository);

  Future<Result<List<GetExamOnSubjectEntity>>> call({
    required String subjectId,
  }) async {
    return await getExamRepository.getExamOnSubject(subjectId: subjectId);
  }
}
