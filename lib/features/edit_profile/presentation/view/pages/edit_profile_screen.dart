import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/shared/widgets/custom_toast.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/edit_profile/presentation/view/pages/reset_password_screen.dart';
import 'package:exam_app/features/edit_profile/presentation/view/widgets/password_change_tile.dart';
import 'package:exam_app/features/edit_profile/presentation/view/widgets/profile_empty_avatar.dart';
import 'package:exam_app/features/edit_profile/presentation/view/widgets/profile_field.dart';
import 'package:exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_events.dart';
import 'package:exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_states.dart';
import 'package:exam_app/features/validations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _didFillUserData = false;
  late EditProfileCubit _editProfileCubit;

  @override
  void initState() {
    super.initState();
    _editProfileCubit = getIt.get<EditProfileCubit>();
    _editProfileCubit.doEvents(GetLoggedUserInfoEvent());
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _fillUserData(EditProfileStates state) {
    if (_didFillUserData) return;

    final user = state.loggedUserInfoState.data?.user;
    if (user == null) return;

    _userNameController.text = user.username ?? '';
    _firstNameController.text = user.firstName ?? '';
    _lastNameController.text = user.lastName ?? '';
    _emailController.text = user.email ?? '';
    _phoneController.text = user.phoneNumber ?? '';

    _didFillUserData = true;
  }

  void _onUpdatePressed() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    _editProfileCubit.updateProfile(lastName: _lastNameController.text);
  }

  void _goToResetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _editProfileCubit,
          child: const ResetPasswordScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _editProfileCubit,
      child: Scaffold(
        backgroundColor: AppColors.whiteF9,
        appBar: AppBar(
          backgroundColor: AppColors.whiteF9,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Edit profile',
            style: 20.medium.copyWith(color: AppColors.black0C),
          ),
        ),
        body: BlocConsumer<EditProfileCubit, EditProfileStates>(
          listener: (context, state) {
            if (state.loggedUserInfoState.state == StateType.success) {
              _fillUserData(state);
            }

            if (state.showEditSuccessToast) {
              CustomToast(
                context: context,
                header: 'Succ ess',
                description:
                    state.editProfileState.data?.message ??
                    'Profile updated successfully',
              ).showToast();

              _editProfileCubit.clearEditSuccessToast();
            }

            if (state.editProfileState.state == StateType.error) {
              CustomToast(
                context: context,
                description: state.editProfileState.exception?.toString(),
                type: ToastificationType.error,
              ).showToast();
            }
          },
          builder: (context, state) {
            final isProfileLoading =
                state.editProfileState.state == StateType.loading;

            final isUserLoading =
                state.loggedUserInfoState.state == StateType.loading;

            if (isUserLoading && !_didFillUserData) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryLight),
              );
            }

            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 20.w,
                  vertical: 16.h,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const ProfileEmptyAvatar(),
                      SizedBox(height: 28.h),

                      ProfileField(
                        title: 'User name',
                        hintText: 'User name',
                        controller: _userNameController,
                        validator: Validations.validateUserName,
                        isReadOnly: false,
                      ),
                      SizedBox(height: 16.h),

                      Row(
                        children: [
                          Expanded(
                            child: ProfileField(
                              title: 'First name',
                              hintText: 'First name',
                              controller: _firstNameController,
                              validator: Validations.validateName,
                              isReadOnly: false,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: ProfileField(
                              title: 'Last name',
                              hintText: 'Last name',
                              controller: _lastNameController,
                              validator: Validations.validateName,
                              isReadOnly: false,
                              onChanged: (value) {
                                context
                                    .read<EditProfileCubit>()
                                    .onLastNameChanged(value ?? '');
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      ProfileField(
                        title: 'Email',
                        hintText: 'Email',
                        controller: _emailController,
                        validator: Validations.validateEmail,
                        isReadOnly: false,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16.h),

                      PasswordChangeTile(onChangeTap: _goToResetPassword),
                      SizedBox(height: 16.h),

                      ProfileField(
                        title: 'Phone number',
                        hintText: 'Phone number',
                        controller: _phoneController,
                        isReadOnly: false,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 32.h),

                      CustomButton(
                        title: 'Update',
                        isLoading: isProfileLoading,
                        onTap: state.isProfileChanged && !isProfileLoading
                            ? _onUpdatePressed
                            : null,
                        radius: 14.r,
                        height: 54.h,
                        backGroundColor: state.isProfileChanged
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
      ),
    );
  }
}
