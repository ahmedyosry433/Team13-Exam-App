sealed class ExamSubjectEvents {}
class GetExamOnSubjectEvent extends ExamSubjectEvents {
  final String subjectId;

  GetExamOnSubjectEvent({required this.subjectId});
}