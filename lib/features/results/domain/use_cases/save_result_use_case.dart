import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/results/domain/repositories/results_repository_contract.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveResultUseCase {
  final ResultsRepositoryContract _repository;

  SaveResultUseCase(this._repository);

  Future<Result<void>> call(QuestionsResult result) async {
    return await _repository.saveExamResult(result);
  }
}
