part of 'results_cubit.dart';

class ResultsStates extends Equatable {
  final BaseState<List<ExamResultCollection>>? getAllResultsState;

  const ResultsStates({this.getAllResultsState});

  ResultsStates copyWith({
    BaseState<List<ExamResultCollection>>? getAllResultsState,
  }) {
    return ResultsStates(
      getAllResultsState: getAllResultsState ?? this.getAllResultsState,
    );
  }

  @override
  List<Object?> get props => [getAllResultsState];
}
