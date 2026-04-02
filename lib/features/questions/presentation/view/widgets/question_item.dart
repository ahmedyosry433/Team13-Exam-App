import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/answer_item.dart';
import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
  final QuestionEntity question;
  final List<String> selectedAnswerKeys;
  final Function(String) onAnswerSelected;

  const QuestionItem({
    super.key,
    required this.question,
    required this.selectedAnswerKeys,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.s24),
          Text(
            question.question ?? '',
            style: 18.bold.copyWith(color: AppColors.black),
          ),
          SizedBox(height: AppSize.s24),
          Expanded(
            child: ListView.builder(
              itemCount: question.answers?.length ?? 0,
              itemBuilder: (context, index) {
                final answer = question.answers![index];
                return AnswerItem(
                  answer: answer,
                  type: question.type ?? QuestionType.single,
                  isSelected: selectedAnswerKeys.contains(answer.answerKey),
                  onTap: () => onAnswerSelected(answer.answerKey!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
