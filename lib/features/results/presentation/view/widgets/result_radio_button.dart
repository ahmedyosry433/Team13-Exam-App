import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';

class ResultRadioButton extends StatelessWidget {
  final bool isSelected;
  final bool isCorrect;
  final bool isMissedCorrect;

  const ResultRadioButton({
    super.key,
    required this.isSelected,
    required this.isCorrect,
    required this.isMissedCorrect,
  });

  Color get color {
    if (isSelected && isCorrect) return AppColors.green0C;
    if (isSelected && !isCorrect) return AppColors.redCC;
    if (isMissedCorrect) return AppColors.green0C;
    return AppColors.primaryLight;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s24,
      height: AppSize.s24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: AppSize.s2),
      ),
      child: isSelected || isMissedCorrect
          ? Center(
              child: Container(
                width: AppSize.s12,
                height: AppSize.s12,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            )
          : null,
    );
  }
}
