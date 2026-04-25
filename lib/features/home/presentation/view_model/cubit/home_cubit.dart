import 'package:equatable/equatable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/home/domain/entities/subjects_entity.dart';
import 'package:exam_app/features/home/domain/use_cases/home_use_case.dart';
import 'package:exam_app/features/home/presentation/view_model/cubit/home_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'home_states.dart';

@injectable
class HomeCubit extends Cubit<SubjectsState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(const SubjectsState());
  void doEvent(HomeEvents event) {
    switch (event) {
      case GetAllSubjectsEvent():
        _getAllSubjects();
        break;
    }
  }

  Future<void> _getAllSubjects() async {
    emit(state.copyWith(getsubjectsState: const BaseState.loading()));
    final result = await _homeUseCase();
    result.when(
      success: (subjects) {
        emit(
          state.copyWith(
            getsubjectsState: BaseState.success(subjects),
            subjects: subjects,
             filteredSubjects: subjects,
          ),
        );
      },
      error: (exception) {
        emit(state.copyWith(getsubjectsState: BaseState.error(exception)));
      },
    );
  }
  void searchSubjects(String query) {
    final trimmedQuery = query.trim().toLowerCase();

    if (trimmedQuery.isEmpty) {
      emit(
        state.copyWith(
          searchQuery: query,
          filteredSubjects: state.subjects,
        ),
      );
      return;
    }

    final filtered = state.subjects.where((subject) {
      final name = (subject.name ?? '').toLowerCase();
      return name.contains(trimmedQuery);
    }).toList();

    emit(
      state.copyWith(
        searchQuery: query,
        filteredSubjects: filtered,
      ),
    );
  }
}
