import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/shared/widgets/custom_app_bar.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/login/presentation/view/widgets/login_.text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          title: AuthConsts.login,
          padding: EdgeInsets.only(left: 16),
        ),
      ),
      body: Column(
        children: [
          LoginTextField(),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              left: 16,
              right: 16,
              bottom: 48,
            ),
            child: Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                    });
                  },
                ),
                Text(
                  AuthConsts.rememberMe,
                  style: 13.regular.copyWith(color: AppColors.gray),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.s86),
                  child: InkWell(
                    onTap: () {
                      // Handle forgot password action
                    },

                    child: Text(
                      AuthConsts.forgotPassword,
                      style: 12.regular.copyWith(
                        color: AppColors.gray,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomButton(title: AuthConsts.login, onTap: () {}),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AuthConsts.donothaveaccount,
                style: 16.regular.copyWith(color: AppColors.gray),
              ),
              InkWell(
                onTap: () {context.go(Routes.register);;},
                child: Text(
                  AuthConsts.signup,
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
    );
  }
}
