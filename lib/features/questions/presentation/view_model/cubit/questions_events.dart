sealed class QuestionsEvents {}

class GetQuestionsEvent extends QuestionsEvents {
  final String? examId;
  GetQuestionsEvent({required this.examId});
}

class SelectAnswerEvent extends QuestionsEvents {
  final int questionIndex;
  final String answerKey;
  SelectAnswerEvent({required this.questionIndex, required this.answerKey});
}

class SubmitExamEvent extends QuestionsEvents {}

class ResetExamEvent extends QuestionsEvents {}

class UpdateTimerEvent extends QuestionsEvents {
  final int seconds;
  UpdateTimerEvent({required this.seconds});
}

class UpdateIndexEvent extends QuestionsEvents {
  final int index;
  UpdateIndexEvent({required this.index});
}
