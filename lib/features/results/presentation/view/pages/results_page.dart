import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/results/presentation/view/widgets/result_question_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultsPage extends StatelessWidget {
  final QuestionsResult result;

  const ResultsPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          LocaleKeys.global_answers.tr(),
          style: 18.bold.copyWith(color: AppColors.black),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: result.questions.length,
        itemBuilder: (context, index) {
          final question = result.questions[index];
          final selectedAnswers = result.selectedAnswers[index] ?? [];
          return ResultQuestionItem(
            question: question,
            selectedAnswerKeys: selectedAnswers,
          );
        },
      ),
    );
  }
}
