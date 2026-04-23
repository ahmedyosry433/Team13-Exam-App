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
  final _formKey = GlobalKey<FormState>();

  bool _rememberMe = false;
  bool _isFormReady = false;

  bool _checkFormReady() {
    return _emailController.text.trim().isNotEmpty &&
        _passwordController.text.trim().length >= 8;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final savedEmail = '';
      if (savedEmail.isNotEmpty) {
        _emailController.text = savedEmail;
        setState(() {
          _rememberMe = true;
          _isFormReady = _checkFormReady();
        });
      }
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
    final cubit = context.read<LogInCubit>();

    return BlocListener<LogInCubit, LoginState>(
      listener: (context, state) {
        if (state.loginSuccess == true) {
          context.go(Routes.home);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: CustomAppBar(
            title: AuthConsts.login,
            padding: const EdgeInsets.only(left: 16),
          ),
        ),
        body: Form(
          key: _formKey,
          onChanged: () {
            final ready = _checkFormReady();
            if (ready != _isFormReady) {
              setState(() {
                _isFormReady = ready;
              });
            }
          },
          child: Column(
            children: [
              LoginTextField(
                emailController: _emailController,
                passwordController: _passwordController,
                emailError: context.select((LogInCubit c) => c.state.emailError),
                passwordError: context.select(
                  (LogInCubit c) => c.state.passwordError,
                ),
              ),
              Builder(
                builder: (context) {
                  final generalError = context.select(
                    (LogInCubit c) => c.state.generalError,
                  );

                  if (generalError == null) return const SizedBox.shrink();

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      generalError,
                      style: 13.regular.copyWith(color: Colors.red),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                  left: 16,
                  right: 16,
                  bottom: 48,
                ),
                child: StatefulBuilder(
                  builder: (context, setInnerState) {
                    return Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setInnerState(() {
                              _rememberMe = value ?? false;
                            });
                            cubit.toggleRememberMe();
                          },
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
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: BlocBuilder<LogInCubit, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const CircularProgressIndicator();
                    }

                    return CustomButton(
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
                    );
                  },
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
        ),
      ),
    );
  }
}