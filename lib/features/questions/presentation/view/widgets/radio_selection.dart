import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';

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
