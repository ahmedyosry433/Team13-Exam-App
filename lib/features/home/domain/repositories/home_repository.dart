import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/home/domain/entities/subjects_entity.dart';

abstract class HomeRepository {
  Future<Result<List<SubjectsEntity>>> getSubjects();
}
