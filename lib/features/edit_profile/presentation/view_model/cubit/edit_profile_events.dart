import 'package:exam_app/features/edit_profile/data/models/request/change_password_request.dart';
import 'package:exam_app/features/edit_profile/data/models/request/edit_profile_request.dart';

sealed class EditProfileEvents {}

class PutEditProfileEvent extends EditProfileEvents {
  final EditProfileRequest editProfileRequest;
  PutEditProfileEvent({required this.editProfileRequest});
}

class GetLoggedUserInfoEvent extends EditProfileEvents {}

class ChangePasswordEvent extends EditProfileEvents {
  final ChangePasswordRequest changePasswordRequest;

  ChangePasswordEvent({required this.changePasswordRequest});
}
