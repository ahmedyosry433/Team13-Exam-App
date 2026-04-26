import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/results/data/datasources/results_local_data_source_contract.dart';
import 'package:exam_app/features/results/domain/repositories/results_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResultsRepositoryContract)
class ResultsRepositoryImpl implements ResultsRepositoryContract {
  final ResultsLocalDataSource _localDataSource;

  ResultsRepositoryImpl(this._localDataSource);

  @override
  Future<Result<List<QuestionsResult>>> getAllExamResults() async {
    try {
      final results = await _localDataSource.getAllExamResults();
      return Success(data: results);
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  @override
  Future<Result<void>> saveExamResult(QuestionsResult result) async {
    try {
      await _localDataSource.saveExamResult(result);
      return const Success(data: null);
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }
}
