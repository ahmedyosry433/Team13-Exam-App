import 'package:exam_app/core/shared/widgets/custom_text_field.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
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
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool isPasswordHidden = true;
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
            controller: widget.emailController,
            hintText: AuthConsts.emailHint,
            textStyle: 16.regular.copyWith(color: AppColors.gray),
            textInputType: TextInputType.emailAddress,
            errorText: widget.emailError,
            enabledBorder: widget.emailError != null
                ? customOutLineBorders(borderColor: AppColors.onErrorLight)
                : null,
            focusedBorder: widget.emailError != null
                ? customOutLineBorders(
                    borderColor: AppColors.onErrorLight,
                    borderWidth: 1.5,
                  )
                : null,
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
            controller: widget.passwordController,
            enabledBorder: widget.passwordError != null
                ? customOutLineBorders(borderColor: AppColors.onErrorLight)
                : null,
            focusedBorder: widget.passwordError != null
                ? customOutLineBorders(
                    borderColor: AppColors.onErrorLight,
                    borderWidth: 1.5,
                  )
                : null,
            isObscureText: isPasswordHidden,
            suffixWidget: IconButton(
              icon: Icon(
                isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                color: AppColors.gray,
              ),
              onPressed: () {
                setState(() {
                  isPasswordHidden = !isPasswordHidden;
                });
              },
            ),
            hintText: AuthConsts.passwordHint,
            textStyle: 16.regular.copyWith(color: AppColors.gray),
            errorText: widget.passwordError,
          ),
        ),
      ],
    );
  }
}
