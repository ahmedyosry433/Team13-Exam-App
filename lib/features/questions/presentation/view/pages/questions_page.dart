import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/exam_appbar.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/questions_body.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/result_body.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<QuestionsCubit>()
            ..doIndented(GetQuestionsEvent(examId: "")),
      child: BlocBuilder<QuestionsCubit, QuestionsStates>(
        buildWhen: (previous, current) =>
            previous.submitExamState != current.submitExamState,
        builder: (context, state) {
          final isResult = state.submitExamState?.state == StateType.success;
          final cubit = context.read<QuestionsCubit>();
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: ExamAppbar(
              title: isResult ? LocaleKeys.questions_exam_score.tr() : null,
            ),
            body: isResult
                ? ResultView(result: state.submitExamState!.data!)
                : QuestionsPageBody(cubit: cubit),
          );
        },
      ),
    );
  }
}
