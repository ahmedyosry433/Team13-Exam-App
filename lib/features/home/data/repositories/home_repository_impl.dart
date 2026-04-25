import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:exam_app/features/home/domain/entities/subjects_entity.dart';
import 'package:exam_app/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSourceContract dataSourceContract;

  HomeRepositoryImpl({required this.dataSourceContract});
  @override
  @override
  Future<Result<List<SubjectsEntity>>> getSubjects() async {
    final result = await dataSourceContract.getSubjects();

    return result.when(
      success: (response) {
        if (response == null) {
          return Success<List<SubjectsEntity>>(data: []);
        }

        final list =
            response.subjects?.map((subject) => subject.toEntity()).toList() ??
            [];

        return Success<List<SubjectsEntity>>(data: list);
      },
      error: (error) {
        return Error(exception: error);
      },
    );
  }
}
