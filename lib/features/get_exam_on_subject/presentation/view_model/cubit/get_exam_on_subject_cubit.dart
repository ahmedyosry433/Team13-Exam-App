import 'package:equatable/equatable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/get_exam_on_subject/domain/entities/get_exam_on_subject_entities.dart';
import 'package:exam_app/features/get_exam_on_subject/domain/use_cases/get_exam_on_subject_use_case.dart';
import 'package:exam_app/features/get_exam_on_subject/presentation/view_model/cubit/get_exam_on_subject_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'get_exam_on_subject_states.dart';
@injectable
class GetExamOnSubjectCubit extends Cubit<GetExamOnSubjectStates> {
  final GetExamOnSubjectUseCase _getExamOnSubjectUseCase;
  GetExamOnSubjectCubit(this._getExamOnSubjectUseCase)
    : super(const GetExamOnSubjectStates());
  void doevent(ExamSubjectEvents event) {
    switch (event) {
      case GetExamOnSubjectEvent():
        _getExamOnSubject(event.subjectId);
    }
  }

  void _getExamOnSubject(String? subjectId) async {
    emit(state.copyWith(getExamOnSubjectState: const BaseState.loading()));
    final result = await _getExamOnSubjectUseCase(
      subjectId: subjectId ?? "69d980117c82914570305dd5",
    );


    result.when(
      success: (exam) {
        emit(state.copyWith(getExamOnSubjectState: BaseState.success(exam)));
      },
      error: (error) {
        emit(state.copyWith(getExamOnSubjectState: BaseState.error(error)));
      },
    );
  }
}
