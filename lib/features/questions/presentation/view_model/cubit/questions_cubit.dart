import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:exam_app/core/routes/app_router.dart';
import 'package:exam_app/features/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/questions/domain/use_cases/get_questions_by_exam_id_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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
          showAboutDialog(
            context: navigatorKey.currentContext!,
            children: [Text('Time is up')],
          );
          _timer?.cancel();
        }
      }
    });
  }

  void selectAnswer(int questionIndex, String answerKey) {
    final currentState = state;
    if (currentState is QuestionsLoaded) {
      final updatedAnswers = Map<int, String?>.from(
        currentState.selectedAnswers,
      );
      updatedAnswers[questionIndex] = answerKey;
      emit(currentState.copyWith(selectedAnswers: updatedAnswers));
    }
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
      20,
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
