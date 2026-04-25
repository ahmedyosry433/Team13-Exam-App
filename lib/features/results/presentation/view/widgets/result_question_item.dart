import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/results/presentation/view/widgets/result_answer_item.dart';
import 'package:flutter/material.dart';

class ResultQuestionItem extends StatelessWidget {
  final QuestionEntity question;
  final List<String> selectedAnswerKeys;

  const ResultQuestionItem({
    super.key,
    required this.question,
    required this.selectedAnswerKeys,
  });

  @override
  Widget build(BuildContext context) {
    final correctKeys = question.correct?.split(',') ?? [];

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSize.s16,
        vertical: AppSize.s8,
      ),
      padding: EdgeInsets.all(AppSize.s16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.s16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question ?? '',
            style: 16.bold.copyWith(color: AppColors.black),
          ),
          SizedBox(height: AppSize.s16),
          ...question.answers?.map((answer) {
                final isSelected = selectedAnswerKeys.contains(
                  answer.answerKey,
                );
                final amICorrectKey = correctKeys.contains(answer.answerKey);

                return ResultAnswerItem(
                  answer: answer,
                  type: question.type ?? QuestionType.singleChoice,
                  isSelected: isSelected,
                  isCorrect: isSelected && amICorrectKey,
                  isMissedCorrect: !isSelected && amICorrectKey,
                );
              }).toList() ??
              [],
        ],
      ),
    );
  }
}
