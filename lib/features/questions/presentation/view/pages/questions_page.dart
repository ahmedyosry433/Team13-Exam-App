import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/exam_appbar.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/questions_body.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuestionsCubit>()..getQuestions(""),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: ExamAppbar(),
        body: const QuestionsPageBody(),
      ),
    );
  }
}
