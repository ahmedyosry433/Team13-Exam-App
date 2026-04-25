import 'package:exam_app/features/edit_profile/domain/entities/user_entity.dart';

class LoggedUserInfoEntity {
  final String? message;
  final UserEntity? user;

  LoggedUserInfoEntity({this.message, this.user});
}
