import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/shared/widgets/custom_app_bar.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_consts.dart';
import 'package:exam_app/features/auth/common/auth_consts/auth_validators/auth_validaters.dart';
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

  
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  bool get _isFormReady =>
      _usernameController.text.trim().isNotEmpty &&
      _firstNameController.text.trim().isNotEmpty &&
      _lastNameController.text.trim().isNotEmpty &&
      AuthValidators.isValidEmail(_emailController.text) &&
      AuthValidators.isValidPassword(_passwordController.text) &&
      AuthValidators.isPasswordMatch(
        _passwordController.text,
        _confirmPasswordController.text,
      ) &&
      AuthValidators.isValidPhone(_phoneController.text);

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() => setState(() {}));
    _firstNameController.addListener(() => setState(() {}));
    _lastNameController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
    _confirmPasswordController.addListener(() => setState(() {}));
    _phoneController.addListener(() => setState(() {}));
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (_) => getIt<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.usernameError != current.usernameError ||
            previous.firstNameError != current.firstNameError ||
            previous.lastNameError != current.lastNameError ||
            previous.emailError != current.emailError ||
            previous.passwordError != current.passwordError ||
            previous.confirmPasswordError != current.confirmPasswordError ||
            previous.phoneError != current.phoneError ||
            previous.generalError != current.generalError,
        listener: (context, state) {
          if (state.registerSuccess) {
            context.go(Routes.home);
          }
        },
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
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
                  RegisterTextField(
                    usernameController: _usernameController,
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    phoneController: _phoneController,
                    usernameError: state.usernameError,
                    firstNameError: state.firstNameError,
                    lastNameError: state.lastNameError,
                    emailError: state.emailError,
                    passwordError: state.passwordError,
                    confirmPasswordError: state.confirmPasswordError,
                    phoneError: state.phoneError,
                   
                    isPasswordHidden: _isPasswordHidden,
                    isConfirmPasswordHidden: _isConfirmPasswordHidden,
                    onTogglePassword: () =>
                        setState(() => _isPasswordHidden = !_isPasswordHidden),
                    onToggleConfirmPassword: () => setState(
                      () => _isConfirmPasswordHidden = !_isConfirmPasswordHidden,
                    ),
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
                      left: 16,
                      right: 16,
                      top: 48,
                    ),
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            title: AuthConsts.register,
                            onTap: () => cubit.register(
                              username: _usernameController.text.trim(),
                              firstName: _firstNameController.text.trim(),
                              lastName: _lastNameController.text.trim(),
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              confirmPassword:
                                  _confirmPasswordController.text.trim(),
                              phone: _phoneController.text.trim(),
                            ),
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
          );
        },
      ),
    );
  }
}