part of 'get_exam_on_subject_cubit.dart';
class GetExamOnSubjectStates extends Equatable {
  final BaseState<List<GetExamOnSubjectEntity>> getExamOnSubjectState;

  const GetExamOnSubjectStates({
    this.getExamOnSubjectState = const BaseState.initial(),
  });
  GetExamOnSubjectStates copyWith({
    BaseState<List<GetExamOnSubjectEntity>>? getExamOnSubjectState,
  }) {
    return GetExamOnSubjectStates(
      getExamOnSubjectState:
          getExamOnSubjectState ?? this.getExamOnSubjectState,
    );
  }

  @override
  List<Object?> get props => [getExamOnSubjectState];
}
