import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/edit_profile/data/models/request/change_password_request.dart';
import 'package:exam_app/features/edit_profile/domain/entities/logged_user_info_entity.dart';
import 'package:exam_app/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:exam_app/features/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:exam_app/features/edit_profile/domain/entities/change_password_entity.dart';
import 'package:exam_app/features/edit_profile/domain/entities/edit_profile_entity.dart';

import 'package:injectable/injectable.dart';

@Injectable()
class EditProfileUseCase {
  final EditProfileRepository _profileRepository;
  EditProfileUseCase(this._profileRepository);
  Future<Result<EditProfileEntity>> editProfile( EditProfileRequest editProfile) {
    return _profileRepository.editProfile( editProfile);
  }
  Future<Result<ChangePasswordEntity>> changePassword( ChangePasswordRequest changePassword) {
    return _profileRepository.changePassword( changePassword);
  }
  Future<Result<LoggedUserInfoEntity>> getLoggedUserInfo() {
    return _profileRepository.getLoggedUserInfo();
  }
}
