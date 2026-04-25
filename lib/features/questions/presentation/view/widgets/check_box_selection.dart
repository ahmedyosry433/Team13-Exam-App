import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';

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
