import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/check_box_selection.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/radio_selection.dart';
import 'package:flutter/material.dart';

class AnswerItem extends StatelessWidget {
  final AnswerEntity answer;
  final bool isSelected;
  final VoidCallback onTap;
  final QuestionType type;

  const AnswerItem({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.onTap,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSize.s12),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.s16,
          vertical: AppSize.s12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondaryLight : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: Row(
          children: [
            if (type == QuestionType.multi)
              CheckBoxSelection(isSelected: isSelected),
            if (type == QuestionType.singleChoice)
              RadioSelection(isSelected: isSelected),
            SizedBox(width: AppSize.s12),
            Expanded(
              child: Text(
                answer.answer ?? '',
                style: 14.regular.copyWith(color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
