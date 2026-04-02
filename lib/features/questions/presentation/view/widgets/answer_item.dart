import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
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
            if (type == QuestionType.single)
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

class RadioSelection extends StatelessWidget {
  const RadioSelection({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s24,
      height: AppSize.s24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primaryLight, width: AppSize.s2),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: AppSize.s12,
                height: AppSize.s12,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}

class CheckBoxSelection extends StatelessWidget {
  const CheckBoxSelection({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Icon(
            Icons.check_box,
            color: AppColors.primaryLight,
            size: AppSize.s24,
          )
        : Icon(
            Icons.check_box_outline_blank,
            color: AppColors.primaryLight,
            size: AppSize.s24,
          );
  }
}
