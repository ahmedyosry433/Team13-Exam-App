import 'package:exam_app/features/edit_profile/domain/entities/user_edit_profile_entity.dart';

class EditProfileEntity {
  final String? message;
  final UserEditProfileEntity? user;

  EditProfileEntity({this.message, this.user});
}
