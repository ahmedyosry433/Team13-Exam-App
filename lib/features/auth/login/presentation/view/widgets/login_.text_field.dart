import 'package:exam_app/core/shared/widgets/custom_text_field.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_validators/auth_validaters.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? emailError;
  final String? passwordError;

  const LoginTextField({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.emailError,
    this.passwordError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: CustomTextFormField(
            labelWidget: Text(
              AuthConsts.emaillable,
              style: 14.light.copyWith(color: AppColors.gray),
            ),
            controller: emailController,
            hintText: AuthConsts.emailHint,
            textStyle: 16.regular.copyWith(color: AppColors.gray),
            textInputType: TextInputType.emailAddress,
            errorText:
                emailError ??
                (emailController.text.isNotEmpty &&
                        !AuthValidators.isValidEmail(emailController.text)
                    ? AuthConsts.erroremail
                    : null),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextFormField(
            labelWidget: Text(
              AuthConsts.passwordlable,
              style: 14.light.copyWith(color: AppColors.gray),
            ),
            controller: passwordController,
            isObscureText: true,
            hintText: AuthConsts.passwordHint,
            textStyle: 16.regular.copyWith(color: AppColors.gray),
            errorText:
                passwordError ??
                (passwordController.text.isNotEmpty &&
                        !AuthValidators.isValidPassword(passwordController.text)
                    ? AuthConsts.errorpassword
                    : null),
          ),
        ),
      ],
    );
  }
}
