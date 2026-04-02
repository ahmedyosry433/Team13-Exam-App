import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/core/routes/app_router.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_animations.dart';
import 'package:exam_app/features/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/questions/domain/use_cases/get_questions_by_exam_id_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';

part 'questions_states.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionsStates> {
  final GetQuestionsByExamIdUseCase _getQuestionsByExamIdUseCase;
  late final PageController pageController;
  Timer? _timer;

  QuestionsCubit(this._getQuestionsByExamIdUseCase)
    : super(const QuestionsStates()) {
    pageController = PageController();
  }
  final int totalTime = 20;

  Future<void> getQuestions(String examId) async {
    emit(state.copyWith(getQuestionsState: const BaseState.loading()));
    await Future.delayed(const Duration(seconds: 1));
    final mockQuestions = _getMockQuestions();
    emit(
      state.copyWith(
        getQuestionsState: BaseState.success(mockQuestions),
        questions: mockQuestions,
        secondsRemaining: totalTime,
        selectedAnswers: {},
        currentIndex: 0,
        submitExamState: const BaseState.initial(),
      ),
    );
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) return;

      if (state.secondsRemaining > 0) {
        emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
      } else {
        showDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.white,
            title: Center(
              child: Text(
                "Time out!",
                style: 18.medium.copyWith(color: AppColors.redCC),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  AppAnimations.timeAnimation,
                  width: 170,
                  height: 170,
                ),
                CustomButton(
                  height: 35,
                  title: "View score",
                  onTap: () {
                    context.pop(context); // Close the dialog
                    submitExam();
                  },
                ),
              ],
            ),
          ),
        );

        _timer?.cancel();
      }
    });
  }

  void selectAnswer(int questionIndex, String answerKey) {
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

  void submitExam() {
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
    _timer?.cancel();

    emit(state.copyWith(submitExamState: BaseState.success(result)));
  }

  void resetExam() {
    emit(
      state.copyWith(
        submitExamState: const BaseState.initial(),
        selectedAnswers: {},
        currentIndex: 0,
      ),
    );
    getQuestions("");
  }

  void nextQuestion() {
    if (state.currentIndex < state.questions.length - 1) {
      final newIndex = state.currentIndex + 1;
      emit(state.copyWith(currentIndex: newIndex));
      pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousQuestion() {
    if (state.currentIndex > 0) {
      final newIndex = state.currentIndex - 1;
      emit(state.copyWith(currentIndex: newIndex));
      pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    pageController.dispose();
    return super.close();
  }

  List<QuestionEntity> _getMockQuestions() {
    return List.generate(
      10,
      (index) => QuestionEntity(
        id: '$index',
        question:
            'Select the correctly punctuated sentence for question ${index + 1}.',
        answers: const [
          AnswerEntity(answerKey: 'A1', answer: 'Its going to rain today.'),
          AnswerEntity(answerKey: 'A2', answer: 'It’s going to rain today.'),
          AnswerEntity(answerKey: 'A3', answer: 'Its going to rain today.'),
          AnswerEntity(answerKey: 'A4', answer: 'Its going to rain today.'),
        ],
        correct: 'A2',
        type: index % 2 == 0 ? QuestionType.multi : QuestionType.single,
      ),
    );
  }
}
