import 'package:exam_app/config/db/isar_service.dart';
import 'package:exam_app/features/results/data/datasources/results_local_data_source_contract.dart';
import 'package:exam_app/features/results/data/models/exam_result_collection.dart';
import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';

@Injectable(as: ResultsLocalDataSource)
class ResultsLocalDataSourceImpl implements ResultsLocalDataSource {
  final IsarService _isarService;

  ResultsLocalDataSourceImpl(this._isarService);

  @override
  Future<void> saveExamResult(ExamResultCollection result) async {
    final isar = await _isarService.db;
    await isar.writeTxn(() async {
      await isar.collection<ExamResultCollection>().put(result);
    });
  }

  @override
  Future<List<ExamResultCollection>> getAllExamResults() async {
    final isar = await _isarService.db;
    final results = await isar
        .collection<ExamResultCollection>()
        .where()
        .findAll();
    results.sort(
      (a, b) => b.createdAt?.compareTo(a.createdAt ?? DateTime.now()) ?? 0,
    );
    return results;
  }
}
