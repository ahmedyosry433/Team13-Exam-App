import 'package:exam_app/core/shared/widgets/custom_text_field.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final String? usernameError;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final String? phoneError;
  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;
  final VoidCallback onTogglePassword;
  final VoidCallback onToggleConfirmPassword;

  const RegisterTextField({
    super.key,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.isPasswordHidden,
    required this.isConfirmPasswordHidden,
    required this.onTogglePassword,
    required this.onToggleConfirmPassword,
    this.usernameError,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.phoneError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: CustomTextFormField(
            labelWidget: Text(
              AuthConsts.usernamelable,
              style: 14.light.copyWith(color: AppColors.gray),
            ),
            hintText: AuthConsts.usernameHint,
            textStyle: 16.regular.copyWith(color: AppColors.gray),
            controller: usernameController,
            errorText: usernameError,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  labelWidget: Text(
                    AuthConsts.firstnamelable,
                    style: 14.light.copyWith(color: AppColors.gray),
                  ),
                  hintText: AuthConsts.firstnameHint,
                  textStyle: 16.regular.copyWith(color: AppColors.gray),
                  controller: firstNameController,
                  errorText: firstNameError,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  labelWidget: Text(
                    AuthConsts.lastnamelable,
                    style: 14.light.copyWith(color: AppColors.gray),
                  ),
                  hintText: AuthConsts.lastnameHint,
                  textStyle: 16.regular.copyWith(color: AppColors.gray),
                  controller: lastNameController,
                  errorText: lastNameError,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: CustomTextFormField(
            labelWidget: Text(
              AuthConsts.emaillable,
              style: 14.light.copyWith(color: AppColors.gray),
            ),
            hintText: AuthConsts.emailHint,
            textStyle: 16.regular.copyWith(color: AppColors.gray),
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            errorText: emailError,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  labelWidget: Text(
                    AuthConsts.passwordlable,
                    style: 14.light.copyWith(color: AppColors.gray),
                  ),
                  hintText: AuthConsts.passwordHint,
                  textStyle: 16.regular.copyWith(color: AppColors.gray),
                  controller: passwordController,
                  isObscureText: isPasswordHidden,
                  suffixWidget: IconButton(
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.gray,
                    ),
                    onPressed: onTogglePassword,
                  ),
                  errorText: passwordError,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  labelWidget: Text(
                    AuthConsts.confirmpasswordlable,
                    style: 14.light.copyWith(color: AppColors.black),
                  ),
                  hintText: AuthConsts.confirmpasswordHint,
                  textStyle: 16.regular.copyWith(color: AppColors.gray),
                  controller: confirmPasswordController,
                  isObscureText: isConfirmPasswordHidden,
                  suffixWidget: IconButton(
                    icon: Icon(
                      isConfirmPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.gray,
                    ),
                    onPressed: onToggleConfirmPassword,
                  ),
                  errorText: confirmPasswordError,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: CustomTextFormField(
            labelWidget: Text(
              AuthConsts.phonelablee,
              style: 14.light.copyWith(color: AppColors.gray),
            ),
            hintText: AuthConsts.phoneHint,
            textStyle: 16.regular.copyWith(color: AppColors.gray),
            controller: phoneController,
            textInputType: TextInputType.phone,
            errorText: phoneError,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}