import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/answer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionItem extends StatelessWidget {
  final QuestionEntity question;
  final String? selectedAnswerKey;
  final Function(String) onAnswerSelected;

  const QuestionItem({
    super.key,
    required this.question,
    required this.selectedAnswerKey,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Text(
            question.question ?? '',
            style: 18.bold.copyWith(color: AppColors.black),
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: ListView.builder(
              itemCount: question.answers?.length ?? 0,
              itemBuilder: (context, index) {
                final answer = question.answers![index];
                return AnswerItem(
                  answer: answer,
                  type: question.type ?? QuestionType.single,
                  isSelected: selectedAnswerKey == answer.answerKey,
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
