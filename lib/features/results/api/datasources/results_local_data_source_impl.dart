import 'package:exam_app/config/db/isar_service.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/results/data/datasources/results_local_data_source_contract.dart';
import 'package:exam_app/features/results/data/models/exam_result_collection.dart';
import 'package:exam_app/features/results/domain/entities/mapper/questions_result_mapper.dart';
import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';

@Injectable(as: ResultsLocalDataSource)
class ResultsLocalDataSourceImpl implements ResultsLocalDataSource {
  final IsarService _isarService;
  final QuestionsResultMapper _mapper;

  ResultsLocalDataSourceImpl(this._isarService, this._mapper);

  @override
  Future<void> saveExamResult(QuestionsResult result) async {
    final isar = await _isarService.db;
    final collection = _mapper.toCollection(result);
    await isar.writeTxn(() async {
      await isar.collection<ExamResultCollection>().put(collection);
    });
  }

  @override
  Future<List<QuestionsResult>> getAllExamResults() async {
    final isar = await _isarService.db;
    final results = await isar
        .collection<ExamResultCollection>()
        .where()
        .findAll();

    results.sort(
      (a, b) => b.createdAt?.compareTo(a.createdAt ?? DateTime.now()) ?? 0,
    );

    return results.map(_mapper.fromCollection).toList();
  }
}
