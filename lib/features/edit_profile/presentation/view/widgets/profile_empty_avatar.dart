import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileEmptyAvatar extends StatelessWidget {
  const ProfileEmptyAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 48.r,
      backgroundColor: AppColors.grayEA,
      child: Icon(
        Icons.person,
        size: 48.r,
        color: AppColors.gray87,
      ),
    );
  }
}