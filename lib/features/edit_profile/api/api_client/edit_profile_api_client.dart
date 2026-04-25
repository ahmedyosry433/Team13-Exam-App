import 'package:dio/dio.dart';
import 'package:exam_app/config/api/app_endpoints.dart';
import 'package:exam_app/features/edit_profile/data/models/request/change_password_request.dart';
import 'package:exam_app/features/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:exam_app/features/edit_profile/data/models/response/change_password_dto.dart';
import 'package:exam_app/features/edit_profile/data/models/response/edit_profile_dto.dart';
import 'package:exam_app/features/edit_profile/data/models/response/logged_user_info_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'edit_profile_api_client.g.dart';

@Injectable()
@RestApi()
abstract class EditProfileApiClient {
  @FactoryMethod()
  factory EditProfileApiClient(Dio dio) = _EditProfileApiClient;
  @GET(AppEndPoints.loggedUserInfo)
  Future<LoggedUserInfoDto> getLoggedUserInfo();
  @PUT(AppEndPoints.editProfile)
  Future<EditProfileDto> editProfile(@Body() EditProfileRequest editProfile);
  @PATCH(AppEndPoints.changePassword)
  Future<ChangePasswordDto> changePassword(
    @Body() ChangePasswordRequest changePassword,
  );
}
