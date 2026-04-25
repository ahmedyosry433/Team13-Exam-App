import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';

class ResultCheckBox extends StatelessWidget {
  final bool isSelected;
  final bool isCorrect;
  final bool isMissedCorrect;

  const ResultCheckBox({
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
    return Icon(
      isSelected ? Icons.check_box : Icons.check_box_outline_blank,
      color: color,
      size: AppSize.s24,
    );
  }
}
