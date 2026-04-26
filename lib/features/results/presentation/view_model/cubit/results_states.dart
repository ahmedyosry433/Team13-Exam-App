part of 'results_cubit.dart';

class ResultsStates extends Equatable {
  final BaseState<List<QuestionsResult>>? getAllResultsState;

  const ResultsStates({this.getAllResultsState});

  ResultsStates copyWith({
    BaseState<List<QuestionsResult>>? getAllResultsState,
  }) {
    return ResultsStates(
      getAllResultsState: getAllResultsState ?? this.getAllResultsState,
    );
  }

  @override
  List<Object?> get props => [getAllResultsState];
}
