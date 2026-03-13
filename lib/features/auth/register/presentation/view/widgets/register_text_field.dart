import 'package:exam_app/core/shared/widgets/custom_text_field.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({super.key});

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
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
