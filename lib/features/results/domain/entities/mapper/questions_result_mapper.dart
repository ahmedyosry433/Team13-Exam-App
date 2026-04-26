import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/results/data/models/exam_result_collection.dart';
import 'package:injectable/injectable.dart';
import 'question_isar_mapper.dart';

@injectable
class QuestionsResultMapper {
  final QuestionIsarMapper _questionMapper;

  QuestionsResultMapper(this._questionMapper);

  ExamResultCollection toCollection(QuestionsResult result) {
    return ExamResultCollection()
      ..correctCount = result.correctCount
      ..incorrectCount = result.incorrectCount
      ..scorePercentage = result.scorePercentage
      ..durationMinutes = result.durationMinutes
      ..totalQuestions = result.totalQuestions
      ..takenDurationMinutes = result.takenDurationMinutes
      ..createdAt = DateTime.now()
      ..questions = result.questions.map(_questionMapper.fromEntity).toList()
      ..selectedAnswers = result.selectedAnswers.entries
          .map(
            (e) =>
                SelectedAnswerIsar(questionIndex: e.key, selectedKeys: e.value),
          )
          .toList();
  }

  QuestionsResult fromCollection(ExamResultCollection collection) {
    final selectedAnswersMap = <int, List<String>>{};
    for (final item in collection.selectedAnswers ?? []) {
      if (item.questionIndex != null) {
        selectedAnswersMap[item.questionIndex!] = item.selectedKeys ?? [];
      }
    }

    return QuestionsResult(
      correctCount: collection.correctCount ?? 0,
      incorrectCount: collection.incorrectCount ?? 0,
      scorePercentage: collection.scorePercentage ?? 0.0,
      durationMinutes: collection.durationMinutes,
      totalQuestions: collection.totalQuestions,
      takenDurationMinutes: collection.takenDurationMinutes,
      questions:
          collection.questions?.map(_questionMapper.toEntity).toList() ?? [],
      selectedAnswers: selectedAnswersMap,
    );
  }
}
