import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionStepper extends StatelessWidget {
  final int current;
  final int total;

  const QuestionStepper({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Question $current of $total',
          style: 16.medium.copyWith(color: AppColors.gray53),
        ),
        SizedBox(height: 12.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s2),
          child: LinearProgressIndicator(
            value: current / total,
            backgroundColor: AppColors.grayCF,
            color: AppColors.primaryLight,
            minHeight: 6.h,
          ),
        ),
      ],
    );
  }
}
