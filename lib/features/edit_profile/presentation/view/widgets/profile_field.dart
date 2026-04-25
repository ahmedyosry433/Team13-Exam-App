import 'package:exam_app/core/shared/widgets/custom_text_field.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isReadOnly;
  final bool isObscureText;
  final TextInputType? keyboardType;
  final Widget? suffixWidget;
  final void Function(String?)? onChanged;
  final AutovalidateMode? autovalidateMode;

  const ProfileField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isReadOnly = false,
    this.isObscureText = false,
    this.keyboardType,
    this.suffixWidget,
    this.onChanged,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      title: title,
      hintText: hintText,
      controller: controller,
      validator: validator,
      isReadOnly: isReadOnly,
      isObscureText: isObscureText,
      textInputType: keyboardType,
      suffixWidget: suffixWidget,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: TextStyle(
        color: AppColors.gray87,
        fontSize: 14.sp,
      ),
      borderRadius: 12.r,
      fillColor: AppColors.white,
      borderColor: AppColors.grayCF,
      contentPadding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.w,
        vertical: 14.h,
      ),
    );
  }
}