part of 'questions_cubit.dart';

sealed class QuestionsStates extends Equatable {
  const QuestionsStates();

  @override
  List<Object?> get props => [];
}

class QuestionsInitial extends QuestionsStates {}

class QuestionsLoading extends QuestionsStates {}

class QuestionsLoaded extends QuestionsStates {
  final List<QuestionEntity> questions;
  final int currentIndex;
  final Map<int, List<String>> selectedAnswers;
  final int secondsRemaining;

  const QuestionsLoaded({
    required this.questions,
    this.currentIndex = 0,
    this.selectedAnswers = const {},
    this.secondsRemaining = 5,
  });

  @override
  List<Object?> get props => [
    questions,
    currentIndex,
    selectedAnswers,
    secondsRemaining,
  ];

  QuestionsLoaded copyWith({
    List<QuestionEntity>? questions,
    int? currentIndex,
    Map<int, List<String>>? selectedAnswers,
    int? secondsRemaining,
  }) {
    return QuestionsLoaded(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
    );
  }
}

class QuestionsError extends QuestionsStates {
  final String message;

  const QuestionsError(this.message);

  @override
  List<Object?> get props => [message];
}
