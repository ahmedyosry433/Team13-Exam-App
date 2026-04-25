import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/shared/widgets/custom_toast.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/edit_profile/presentation/view/widgets/password_visibility_button.dart';
import 'package:exam_app/features/edit_profile/presentation/view/widgets/profile_field.dart';
import 'package:exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_states.dart';
import 'package:exam_app/features/validations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _oldVisible = false;
  bool _newVisible = false;
  bool _confirmVisible = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onPasswordChanged(String? value) {
    final oldPassword = _oldPasswordController.text;
    final password = _newPasswordController.text;
    final rePassword = _confirmPasswordController.text;

    context.read<EditProfileCubit>().onPasswordFieldsChanged(
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );
  }

  void _onUpdatePressed() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    context.read<EditProfileCubit>().changePassword(
      oldPassword: _oldPasswordController.text,
      password: _newPasswordController.text,
      rePassword: _confirmPasswordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteF9,
      appBar: AppBar(
        backgroundColor: AppColors.whiteF9,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Reset password',
          style: 20.medium.copyWith(color: AppColors.black0C),
        ),
      ),
      body: BlocConsumer<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {
          if (state.changePasswordState.state == StateType.success) {
            CustomToast(
              context: context,
              header: 'Success',
              description:
                  state.changePasswordState.data?.message ??
                  'Password changed successfully',
            ).showToast();

            Navigator.pop(context);
          }

          if (state.changePasswordState.state == StateType.error) {
            CustomToast(
              context: context,
              header: 'Error',
              description: state.changePasswordState.exception?.toString(),
              type: ToastificationType.error,
            ).showToast();
          }
        },
        builder: (context, state) {
          final isLoading =
              state.changePasswordState.state == StateType.loading;

          return SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ProfileField(
                      title: 'Current password',
                      hintText: 'Current password',
                      controller: _oldPasswordController,
                      isObscureText: !_oldVisible,
                      validator: Validations.validateLoginPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: _onPasswordChanged,
                      suffixWidget: PasswordVisibilityButton(
                        isVisible: _oldVisible,
                        onTap: () {
                          setState(() => _oldVisible = !_oldVisible);
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ProfileField(
                      title: 'New password',
                      hintText: 'New password',
                      controller: _newPasswordController,
                      isObscureText: !_newVisible,
                      validator: Validations.validatePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: _onPasswordChanged,
                      suffixWidget: PasswordVisibilityButton(
                        isVisible: _newVisible,
                        onTap: () {
                          setState(() => _newVisible = !_newVisible);
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ProfileField(
                      title: 'Confirm password',
                      hintText: 'Confirm password',
                      controller: _confirmPasswordController,
                      isObscureText: !_confirmVisible,
                      validator: (value) {
                        return Validations.validatePasswordVerification(
                          value,
                          _newPasswordController.text,
                        );
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: _onPasswordChanged,
                      suffixWidget: PasswordVisibilityButton(
                        isVisible: _confirmVisible,
                        onTap: () {
                          setState(() => _confirmVisible = !_confirmVisible);
                        },
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      title: 'Update',
                      isLoading: isLoading,
                      onTap: state.isPasswordFormValid && !isLoading
                          ? _onUpdatePressed
                          : null,
                      radius: 14.r,
                      height: 54.h,
                      backGroundColor: state.isPasswordFormValid
                          ? AppColors.primaryLight
                          : AppColors.gray87,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
