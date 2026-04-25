import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordVisibilityButton extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onTap;

  const PasswordVisibilityButton({
    super.key,
    required this.isVisible,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: AppColors.gray87,
      ),
    );
  }
}