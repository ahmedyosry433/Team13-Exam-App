import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/results/data/models/exam_result_collection.dart';
import 'package:exam_app/features/results/domain/repositories/results_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllResultsUseCase {
  final ResultsRepositoryContract _repository;

  GetAllResultsUseCase(this._repository);

  Future<Result<List<ExamResultCollection>>> call() async {
    return await _repository.getAllExamResults();
  }
}
