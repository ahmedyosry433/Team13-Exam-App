import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/questions/domain/entities/question_entity.dart';
import 'package:exam_app/features/results/presentation/view/widgets/result_check_box.dart';
import 'package:exam_app/features/results/presentation/view/widgets/result_radio_button.dart';
import 'package:flutter/material.dart';

class ResultAnswerItem extends StatelessWidget {
  final AnswerEntity answer;
  final bool isSelected;
  final bool isCorrect;
  final bool isMissedCorrect;
  final QuestionType type;

  const ResultAnswerItem({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.isMissedCorrect,
    required this.type,
  });

  Color get borderColor {
    if (isSelected && isCorrect) return AppColors.green0C;
    if (isSelected && !isCorrect) return AppColors.redCC;
    if (isMissedCorrect) return AppColors.green0C;
    return AppColors.transparent;
  }

  Color get backgroundColor {
    if (isSelected && isCorrect) {
      return AppColors.green0C.withValues(alpha: 0.1);
    }
    if (isSelected && !isCorrect) return AppColors.errorLight;
    if (isMissedCorrect) return AppColors.green0C.withValues(alpha: 0.1);
    return AppColors.surfaceLight;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSize.s12),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.s16,
        vertical: AppSize.s12,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSize.s10),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          if (type == QuestionType.multi)
            ResultCheckBox(
              isSelected: isSelected,
              isCorrect: isCorrect,
              isMissedCorrect: isMissedCorrect,
            ),
          if (type == QuestionType.singleChoice)
            ResultRadioButton(
              isSelected: isSelected,
              isCorrect: isCorrect,
              isMissedCorrect: isMissedCorrect,
            ),
          SizedBox(width: AppSize.s12),
          Expanded(
            child: Text(
              answer.answer ?? '',
              style: 14.regular.copyWith(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
