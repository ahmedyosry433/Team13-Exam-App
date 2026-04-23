import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/shared/widgets/custom_app_bar.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/validations/validations.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/register/presentation/view/widgets/register_text_field.dart';
import 'package:exam_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  final ValueNotifier<bool> _isFormReadyNotifier = ValueNotifier(false);

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  bool get _isFormReady =>
      _usernameController.text.trim().isNotEmpty &&
      _firstNameController.text.trim().isNotEmpty &&
      _lastNameController.text.trim().isNotEmpty &&
      Validations.validateEmail(_emailController.text) == null &&
      Validations.validatePassword(_passwordController.text) == null &&
      Validations.validatePasswordVerification(
            _passwordController.text,
            _confirmPasswordController.text,
          ) ==
          null &&
      Validations.validatePhoneNumber(_phoneController.text, 11) == null;

  void _updateFormState() {
    _isFormReadyNotifier.value = _isFormReady;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _isFormReadyNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (previous, current) =>
            previous.registerSuccess != current.registerSuccess,
        listener: (context, state) {
          if (state.registerSuccess) {
            context.go(Routes.home);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: CustomAppBar(
              title: AuthConsts.register,
              padding: const EdgeInsets.only(left: 16),
            ),
          ),
          body: Form(
            onChanged: _updateFormState,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  StatefulBuilder(
                    builder: (context, setLocalState) {
                      return RegisterTextField(
                        usernameController: _usernameController,
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        phoneController: _phoneController,
                        usernameError: context.select(
                          (RegisterCubit c) => c.state.usernameError,
                        ),
                        firstNameError: context.select(
                          (RegisterCubit c) => c.state.firstNameError,
                        ),
                        lastNameError: context.select(
                          (RegisterCubit c) => c.state.lastNameError,
                        ),
                        emailError: context.select(
                          (RegisterCubit c) => c.state.emailError,
                        ),
                        passwordError: context.select(
                          (RegisterCubit c) => c.state.passwordError,
                        ),
                        confirmPasswordError: context.select(
                          (RegisterCubit c) => c.state.confirmPasswordError,
                        ),
                        phoneError: context.select(
                          (RegisterCubit c) => c.state.phoneError,
                        ),
                        isPasswordHidden: _isPasswordHidden,
                        isConfirmPasswordHidden: _isConfirmPasswordHidden,
                        onTogglePassword: () => setLocalState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        }),
                        onToggleConfirmPassword: () => setLocalState(() {
                          _isConfirmPasswordHidden =
                              !_isConfirmPasswordHidden;
                        }),
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      final generalError = context.select(
                        (RegisterCubit c) => c.state.generalError,
                      );

                      if (generalError == null) {
                        return const SizedBox.shrink();
                      }

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
                      left: 16,
                      right: 16,
                      top: 48,
                    ),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _isFormReadyNotifier,
                      builder: (context, isFormReady, _) {
                        return BlocBuilder<RegisterCubit, RegisterState>(
                          buildWhen: (previous, current) =>
                              previous.isLoading != current.isLoading,
                          builder: (context, state) {
                            if (state.isLoading) {
                              return const CircularProgressIndicator();
                            }

                            final cubit = context.read<RegisterCubit>();

                            return CustomButton(
                              title: AuthConsts.register,
                              onTap: isFormReady
                                  ? () => cubit.register(
                                        userName: _usernameController.text.trim(),
                                        firstName:
                                            _firstNameController.text.trim(),
                                        lastName:
                                            _lastNameController.text.trim(),
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                        confirmPassword:
                                            _confirmPasswordController.text
                                                .trim(),
                                        phone: _phoneController.text.trim(),
                                      )
                                  : null,
                              backGroundColor: isFormReady
                                  ? AppColors.blue02
                                  : AppColors.gray87,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AuthConsts.haveaccount,
                        style: 16.regular.copyWith(color: AppColors.gray),
                      ),
                      InkWell(
                        onTap: () => context.go(Routes.login),
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
          ),
        ),
      ),
    );
  }
}