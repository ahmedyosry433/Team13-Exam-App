import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/shared/widgets/custom_app_bar.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/register/presentation/view/widgets/register_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          title: AuthConsts.register,
          padding: EdgeInsets.only(left: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterTextField(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: CustomButton(title: AuthConsts.register, onTap: () {}),
            ), const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AuthConsts.haveaccount,
                  style: 16.regular.copyWith(color: AppColors.gray),
                ),
                InkWell(
                  onTap: () {context.go(Routes.login);;},
                  child: Text(
                    AuthConsts.login,
                    style: 16.regular.copyWith(
                      color: AppColors.blue02,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
