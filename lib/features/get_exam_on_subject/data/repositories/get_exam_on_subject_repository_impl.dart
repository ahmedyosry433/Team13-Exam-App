import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/get_exam_on_subject/data/datasources/get_exam_on_subject_remote_data_source_contract.dart';
import 'package:exam_app/features/get_exam_on_subject/domain/entities/get_exam_on_subject_entities.dart';
import 'package:exam_app/features/get_exam_on_subject/domain/repositories/get_exam_on_subject_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetExamOnSubjectRepository)
class GetExamOnSubjectRepositoryImpl implements GetExamOnSubjectRepository {
  final GetExamOnSubjectRemoteDataSourceContract remoteDataSource;

  const GetExamOnSubjectRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<List<GetExamOnSubjectEntity>>> getExamOnSubject({
    required String subjectId,
  }) async {
    final result = await remoteDataSource.getExamOnSubject(
      subjectId: subjectId,
    );

    return result.when(
      success: (response) {
        final List<GetExamOnSubjectEntity> examSubject =
            response?.exams?.map((exam) => exam.toEntity()).toList() ?? [];

        return Success<List<GetExamOnSubjectEntity>>(data: examSubject);
      },
      error: (error) {
        return Error(exception: error);
      },
    );
  }
}