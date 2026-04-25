import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordChangeTile extends StatelessWidget {
  final VoidCallback onChangeTap;

  const PasswordChangeTile({
    super.key,
    required this.onChangeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: 14.light.copyWith(color: AppColors.backgroundDark),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.grayCF),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '********',
                  style: 16.regular.copyWith(color: AppColors.black0C),
                ),
              ),
              GestureDetector(
                onTap: onChangeTap,
                child: Text(
                  'Change',
                  style: 14.medium.copyWith(color: AppColors.primaryLight),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}