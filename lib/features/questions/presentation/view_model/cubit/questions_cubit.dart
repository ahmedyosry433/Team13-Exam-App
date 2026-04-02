import 'dart:async';

import 'package:equatable/equatable.dart';
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
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';

part 'questions_states.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionsStates> {
  final GetQuestionsByExamIdUseCase _getQuestionsByExamIdUseCase;
  late final PageController pageController;
  Timer? _timer;

  QuestionsCubit(this._getQuestionsByExamIdUseCase)
    : super(QuestionsInitial()) {
    pageController = PageController();
  }
  final int totalTime = 60;

  Future<void> getQuestions(String examId) async {
    emit(QuestionsLoading());
    await Future.delayed(const Duration(seconds: 1));
    final mockQuestions = _getMockQuestions();
    emit(QuestionsLoaded(questions: mockQuestions));
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) return;
      final currentState = state;

      if (currentState is QuestionsLoaded) {
        if (currentState.secondsRemaining > 0) {
          emit(
            currentState.copyWith(
              secondsRemaining: currentState.secondsRemaining - 1,
            ),
          );
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
                      Navigator.pop(context); // Close the dialog
                      submitExam();
                    },
                  ),
                ],
              ),
            ),
          );
          _timer?.cancel();
        }
      }
    });
  }

  void selectAnswer(int questionIndex, String answerKey) {
    final currentState = state;
    if (currentState is QuestionsLoaded) {
      final question = currentState.questions[questionIndex];
      final updatedAnswers = Map<int, List<String>>.from(
        currentState.selectedAnswers,
      );

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
        // For single choice, replace the list with only the new answer
        currentSelected.clear();
        currentSelected.add(answerKey);
      }

      updatedAnswers[questionIndex] = currentSelected;
      emit(currentState.copyWith(selectedAnswers: updatedAnswers));
    }
  }

  void submitExam() {
    final currentState = state;
    if (currentState is QuestionsLoaded) {
      int correctCount = 0;
      int incorrectCount = 0;

      for (int i = 0; i < currentState.questions.length; i++) {
        final question = currentState.questions[i];
        final selected = currentState.selectedAnswers[i] ?? [];
        final correct = question.correct;

        bool isCorrect = false;
        if (question.type == QuestionType.multi) {
          // Assuming comma-separated or similar for multiple correct if it's a string,
          // but based on mock it's just a single key.
          // So let's check if selected contains the correct key and matches perfectly.
          // For now, let's treat 'correct' as a comma-separated list of keys for 'multi' type.
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

      final scorePercentage =
          (correctCount / currentState.questions.length) * 100;

      emit(
        QuestionsResult(
          correctCount: correctCount,
          incorrectCount: incorrectCount,
          scorePercentage: scorePercentage,
          questions: currentState.questions,
          selectedAnswers: currentState.selectedAnswers,
        ),
      );
      _timer?.cancel();
    }
  }

  void resetExam() {
    getQuestions(""); // Or some specific ID if needed.
  }

  void nextQuestion() {
    final currentState = state;
    if (currentState is QuestionsLoaded) {
      if (currentState.currentIndex < currentState.questions.length - 1) {
        final newIndex = currentState.currentIndex + 1;
        emit(currentState.copyWith(currentIndex: newIndex));
        pageController.animateToPage(
          newIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void previousQuestion() {
    final currentState = state;
    if (currentState is QuestionsLoaded) {
      if (currentState.currentIndex > 0) {
        final newIndex = currentState.currentIndex - 1;
        emit(currentState.copyWith(currentIndex: newIndex));
        pageController.animateToPage(
          newIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
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
