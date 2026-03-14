import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/shared/widgets/custom_app_bar.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/login/presentation/view/widgets/login_.text_field.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool get _isFormReady =>
      _emailController.text.trim().isNotEmpty &&
      _passwordController.text.trim().length >= 8;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginCubit>().autoLoginIfTokenExists(context);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.loginSuccess == true) {
            context.go(Routes.home);
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            appBar: AppBar(
              title: CustomAppBar(
                title: AuthConsts.login,
                padding: EdgeInsets.only(left: 16),
              ),
            ),
            body: Column(
              children: [
                LoginTextField(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  emailError: state.emailError,
                  passwordError: state.passwordError,
                ),

                if (state.generalError != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      state.generalError!,
                      style: 13.regular.copyWith(color: Colors.red),
                    ),
                  ),

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
                        value: state.rememberMe,
                        onChanged: (_) => cubit.toggleRememberMe(),
                      ),
                      Text(
                        AuthConsts.rememberMe,
                        style: 13.regular.copyWith(color: AppColors.gray),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSize.s86),
                        child: InkWell(
                          onTap: () {},
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),

                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          title: AuthConsts.login,
                          onTap: _isFormReady
                              ? () => cubit.login(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                )
                              : null,
                          backGroundColor: _isFormReady
                              ? AppColors.blue02
                              : AppColors.gray87,
                        ),
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
                      onTap: () => context.go(Routes.register),
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
        },
      ),
    );
  }
}
