import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/edit_profile/data/models/request/change_password_request.dart';
import 'package:exam_app/features/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:exam_app/features/edit_profile/data/models/response/change_password_dto.dart';
import 'package:exam_app/features/edit_profile/data/models/response/edit_profile_dto.dart';
import 'package:exam_app/features/edit_profile/data/models/response/logged_user_info_dto.dart';

abstract class EditProfileRemoteDataSourceContract {
  Future<Result<LoggedUserInfoDto>> getLoggedUserInfo();
  Future<Result<EditProfileDto>> editProfile( EditProfileRequest editProfile);
  Future<Result<ChangePasswordDto>> changePassword( ChangePasswordRequest changePassword);
}