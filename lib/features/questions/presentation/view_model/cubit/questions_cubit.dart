import 'dart:async';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/questions/domain/use_cases/get_questions_by_exam_id_use_case.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'questions_states.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionsStates> {
  final GetQuestionsByExamIdUseCase _getQuestionsByExamIdUseCase;

  QuestionsCubit(this._getQuestionsByExamIdUseCase)
    : super(const QuestionsStates());

  void doIndented(QuestionsEvents event) {
    switch (event) {
      case GetQuestionsEvent():
        _getQuestions(event.examId!);
      case SelectAnswerEvent():
        _selectAnswer(event.questionIndex, event.answerKey);
      case SubmitExamEvent():
        _submitExam();
      case ResetExamEvent():
        _resetExam();

      case UpdateTimerEvent():
        _updateTimer(event.seconds);
      case UpdateIndexEvent():
        _updateIndex(event.index);
    }
  }

  Future<void> _getQuestions(String examId) async {
    emit(state.copyWith(getQuestionsState: const BaseState.loading()));
    final result = await _getQuestionsByExamIdUseCase(
      "69d980117c82914570305dd5",
    );
    result.when(
      success: (questions) {
        emit(
          state.copyWith(
            getQuestionsState: BaseState.success(questions),
            questions: questions,
            secondsRemaining: questions?.first.exam?.duration ?? 0,
            selectedAnswers: {},
            currentIndex: 0,
            submitExamState: const BaseState.initial(),
          ),
        );
      },
      error: (exception) {
        emit(state.copyWith(getQuestionsState: BaseState.error(exception)));
      },
    );
  }

  void _selectAnswer(int questionIndex, String answerKey) {
    final question = state.questions[questionIndex];
    final updatedAnswers = Map<int, List<String>>.from(state.selectedAnswers);

    final currentSelected = List<String>.from(
      updatedAnswers[questionIndex] ?? [],
    );

    if (question.type == QuestionType.multi) {
      if (currentSelected.contains(answerKey)) {
        currentSelected.remove(answerKey);
      } else {
        currentSelected.add(answerKey);
      }
    } else {
      currentSelected.clear();
      currentSelected.add(answerKey);
    }

    updatedAnswers[questionIndex] = currentSelected;
    log("updatedAnswers: $updatedAnswers");
    emit(state.copyWith(selectedAnswers: updatedAnswers));
  }

  void _submitExam() {
    emit(state.copyWith(submitExamState: const BaseState.loading()));

    int correctCount = 0;
    int incorrectCount = 0;

    for (int i = 0; i < state.questions.length; i++) {
      final question = state.questions[i];
      final selected = state.selectedAnswers[i] ?? [];
      final correct = question.correct;

      bool isCorrect = false;
      if (question.type == QuestionType.multi) {
        final correctKeys = correct?.split(',') ?? [];
        if (selected.length == correctKeys.length &&
            selected.every((key) => correctKeys.contains(key))) {
          isCorrect = true;
        }
      } else {
        if (selected.isNotEmpty && selected.first == correct) {
          isCorrect = true;
        }
      }

      if (isCorrect) {
        correctCount++;
      } else {
        incorrectCount++;
      }
    }

    final scorePercentage = (correctCount / state.questions.length) * 100;

    final result = QuestionsResult(
      correctCount: correctCount,
      incorrectCount: incorrectCount,
      scorePercentage: scorePercentage,
      questions: state.questions,
      selectedAnswers: state.selectedAnswers,
    );

    emit(state.copyWith(submitExamState: BaseState.success(result)));
  }

  void _resetExam() {
    emit(
      state.copyWith(
        submitExamState: const BaseState.initial(),
        selectedAnswers: {},
        currentIndex: 0,
      ),
    );
    doIndented(GetQuestionsEvent(examId: ""));
  }

  void _updateTimer(int seconds) {
    emit(state.copyWith(secondsRemaining: seconds));
  }

  void _updateIndex(int index) {
    emit(
      state.copyWith(
        currentIndex: index,
        updatePageIndex: const BaseState.success(null),
      ),
    );
    emit(state.copyWith(updatePageIndex: const BaseState.initial()));
  }
}
