import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/results/domain/repositories/results_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllResultsUseCase {
  final ResultsRepositoryContract _repository;

  GetAllResultsUseCase(this._repository);

  Future<Result<List<QuestionsResult>>> call() async {
    return await _repository.getAllExamResults();
  }
}
