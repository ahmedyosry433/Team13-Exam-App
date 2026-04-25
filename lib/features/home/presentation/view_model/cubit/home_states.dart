part of 'home_cubit.dart';

class SubjectsState extends Equatable {
  final BaseState<List<SubjectsEntity>> getsubjectsState;
  final List<SubjectsEntity> subjects;
  final List<SubjectsEntity> filteredSubjects;
  final String searchQuery;

  const SubjectsState({
    this.getsubjectsState = const BaseState.initial(),
    this.subjects = const [],
    this.filteredSubjects = const [],
    this.searchQuery = '',
  });
  SubjectsState copyWith({
    BaseState<List<SubjectsEntity>>? getsubjectsState,
    List<SubjectsEntity>? subjects,
    List<SubjectsEntity>? filteredSubjects,
    String? searchQuery,
  }) {
    return SubjectsState(
      getsubjectsState: getsubjectsState ?? this.getsubjectsState,
      subjects: subjects ?? this.subjects,
      filteredSubjects: filteredSubjects ?? this.filteredSubjects,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
    getsubjectsState,
    subjects,
    filteredSubjects,
    searchQuery,
  ];
}
