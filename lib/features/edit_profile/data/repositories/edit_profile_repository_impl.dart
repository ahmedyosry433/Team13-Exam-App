import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/edit_profile/data/datasources/edit_profile_remote_data_source_contract.dart';
import 'package:exam_app/features/edit_profile/data/models/request/change_password_request.dart';
import 'package:exam_app/features/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:exam_app/features/edit_profile/domain/entities/change_password_entity.dart';
import 'package:exam_app/features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:exam_app/features/edit_profile/domain/entities/logged_user_info_entity.dart';
import 'package:exam_app/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImpl implements EditProfileRepository {
  final EditProfileRemoteDataSourceContract _remoteDataSource;
  EditProfileRepositoryImpl(this._remoteDataSource);

  @override
  @override
  Future<Result<LoggedUserInfoEntity>> getLoggedUserInfo() async {
    final result = await _remoteDataSource.getLoggedUserInfo();

    return result.when(
      success: (loggedUser) {
        if (loggedUser == null) {
          return Error<LoggedUserInfoEntity>(
            exception: Exception("Un Logged user "),
          );
        }

        return Success<LoggedUserInfoEntity>(data: loggedUser.toEntity());
      },
      error: (exception) {
        return Error<LoggedUserInfoEntity>(exception: exception);
      },
    );
  }

  @override
  Future<Result<EditProfileEntity>> editProfile(
      EditProfileRequest editProfile,
  ) async {
    final result = await _remoteDataSource.editProfile(
       editProfile,
    );

    return result.when(
      success: (editedProfile) {
        if (editedProfile == null) {
          return Error<EditProfileEntity>(
            exception: Exception("Failed to edit profile"),
          );
        }

        return Success<EditProfileEntity>(data: editedProfile.toEntity());
      },
      error: (exception) {
        return Error<EditProfileEntity>(exception: exception);
      },
    );
  }

  @override
  Future<Result<ChangePasswordEntity>> changePassword(
      ChangePasswordRequest changePassword,
  ) async {
    final result = await _remoteDataSource.changePassword(
      changePassword,
    );

    return result.when(
      success: (changePasswordResult) {
        if (changePasswordResult == null) {
          return Error<ChangePasswordEntity>(
            exception: Exception("Failed to change password"),
          );
        }

        return Success<ChangePasswordEntity>(
          data: changePasswordResult.toEntity(),
        );
      },
      error: (exception) {
        return Error<ChangePasswordEntity>(exception: exception);
      },
    );
  }
}
