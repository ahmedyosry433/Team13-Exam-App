import 'package:exam_app/features/questions/domain/use_cases/get_questions_by_exam_id_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'questions_states.dart';

@Injectable()
class QuestionsCubit extends Cubit<QuestionsStates> {
  final GetQuestionsByExamIdUseCase _getQuestionsByExamIdUseCase;
  QuestionsCubit(this._getQuestionsByExamIdUseCase) : super(QuestionsStates());

  Future<void> getQuestions(String examId) async {
    _getQuestionsByExamIdUseCase(examId);
  }
}
