part of 'questions_cubit.dart';

class QuestionsStates extends Equatable {
  final BaseState<List<QuestionEntity>>? getQuestionsState;
  final BaseState<QuestionsResult>? submitExamState;
  final List<QuestionEntity> questions;
  final int currentIndex;
  final Map<int, List<String>> selectedAnswers;
  final int secondsRemaining;
  final BaseState<void>? updatePageIndex;

  const QuestionsStates({
    this.getQuestionsState = const BaseState.initial(),
    this.submitExamState = const BaseState.initial(),
    this.updatePageIndex = const BaseState.initial(),
    this.questions = const [],
    this.currentIndex = 0,
    this.selectedAnswers = const {},
    this.secondsRemaining = 0,
  });

  QuestionsStates copyWith({
    BaseState<List<QuestionEntity>>? getQuestionsState,
    BaseState<QuestionsResult>? submitExamState,
    List<QuestionEntity>? questions,
    int? currentIndex,
    Map<int, List<String>>? selectedAnswers,
    int? secondsRemaining,
    BaseState<void>? updatePageIndex,
  }) {
    return QuestionsStates(
      getQuestionsState: getQuestionsState ?? this.getQuestionsState,
      submitExamState: submitExamState ?? this.submitExamState,
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      updatePageIndex: updatePageIndex ?? this.updatePageIndex,
    );
  }

  @override
  List<Object?> get props => [
    getQuestionsState,
    submitExamState,
    questions,
    currentIndex,
    selectedAnswers,
    secondsRemaining,
    updatePageIndex,
  ];
}

class QuestionsResult extends Equatable {
  final int correctCount;
  final int incorrectCount;
  final double scorePercentage;
  final List<QuestionEntity> questions;
  final Map<int, List<String>> selectedAnswers;

  const QuestionsResult({
    required this.correctCount,
    required this.incorrectCount,
    required this.scorePercentage,
    required this.questions,
    required this.selectedAnswers,
  });

  @override
  List<Object?> get props => [
    correctCount,
    incorrectCount,
    scorePercentage,
    questions,
    selectedAnswers,
  ];
}
