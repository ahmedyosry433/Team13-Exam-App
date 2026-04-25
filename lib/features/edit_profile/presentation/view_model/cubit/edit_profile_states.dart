import 'package:equatable/equatable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/edit_profile/domain/entities/change_password_entity.dart';
import 'package:exam_app/features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:exam_app/features/edit_profile/domain/entities/logged_user_info_entity.dart';

class EditProfileStates extends Equatable {
  final BaseState<EditProfileEntity> editProfileState;
  final BaseState<ChangePasswordEntity> changePasswordState;
  final BaseState<LoggedUserInfoEntity> loggedUserInfoState;

  final bool isProfileChanged;
  final bool isPasswordFormValid;
  final bool showEditSuccessToast;

  const EditProfileStates({
    this.editProfileState = const BaseState.initial(),
    this.changePasswordState = const BaseState.initial(),
    this.loggedUserInfoState = const BaseState.initial(),
    this.isProfileChanged = false,
    this.isPasswordFormValid = false,
    this.showEditSuccessToast = false,
  });

  EditProfileStates copyWith({
    BaseState<EditProfileEntity>? editProfileState,
    BaseState<ChangePasswordEntity>? changePasswordState,
    BaseState<LoggedUserInfoEntity>? loggedUserInfoState,
    bool? isProfileChanged,
    bool? isPasswordFormValid,
    bool? showEditSuccessToast,
  }) {
    return EditProfileStates(
      editProfileState: editProfileState ?? this.editProfileState,
      changePasswordState: changePasswordState ?? this.changePasswordState,
      loggedUserInfoState: loggedUserInfoState ?? this.loggedUserInfoState,
      isProfileChanged: isProfileChanged ?? this.isProfileChanged,
      isPasswordFormValid: isPasswordFormValid ?? this.isPasswordFormValid,
      showEditSuccessToast:
          showEditSuccessToast ?? this.showEditSuccessToast,
    );
  }

  @override
  List<Object?> get props => [
        editProfileState,
        changePasswordState,
        loggedUserInfoState,
        isProfileChanged,
        isPasswordFormValid,
        showEditSuccessToast,
      ];
}