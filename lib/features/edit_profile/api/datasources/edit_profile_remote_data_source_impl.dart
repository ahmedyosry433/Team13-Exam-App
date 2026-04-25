
import 'package:exam_app/config/api/api_executer.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/edit_profile/api/api_client/edit_profile_api_client.dart';
import 'package:exam_app/features/edit_profile/data/datasources/edit_profile_remote_data_source_contract.dart';
import 'package:exam_app/features/edit_profile/data/models/request/change_password_request.dart';
import 'package:exam_app/features/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:exam_app/features/edit_profile/data/models/response/change_password_dto.dart';
import 'package:exam_app/features/edit_profile/data/models/response/edit_profile_dto.dart';
import 'package:exam_app/features/edit_profile/data/models/response/logged_user_info_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRemoteDataSourceContract)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSourceContract {
  final EditProfileApiClient _apiClient;

  EditProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<LoggedUserInfoDto>> getLoggedUserInfo() async {
   return await executeApi(()async {
      final response = await _apiClient.getLoggedUserInfo();
      return response;
    });
  }

  @override
  Future<Result<EditProfileDto>> editProfile( EditProfileRequest editProfile) async {
   return await executeApi(()async {
      final response = await _apiClient.editProfile( editProfile);
      return response;
    });
  }

  @override
  Future<Result<ChangePasswordDto>> changePassword(ChangePasswordRequest changePassword) async {
   return await executeApi(()async {
      final response = await _apiClient.changePassword( changePassword);
      return response;
    });
  }
}