import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/exam_appbar.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/questions_body.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/result_body.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<QuestionsCubit>();
    return BlocProvider.value(
      value: cubit..getQuestions(""),
      child: BlocBuilder<QuestionsCubit, QuestionsStates>(
        builder: (context, state) {
          final isResult = state.submitExamState?.state == StateType.success;
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: ExamAppbar(title: isResult ? 'Exam score' : null),
            body: isResult
                ? ResultView(result: state.submitExamState!.data!)
                : const QuestionsPageBody(),
          );
        },
      ),
    );
  }
}
