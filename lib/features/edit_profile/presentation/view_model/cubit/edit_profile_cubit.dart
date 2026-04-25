import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/edit_profile/data/models/request/change_password_request.dart';
import 'package:exam_app/features/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:exam_app/features/edit_profile/domain/entities/logged_user_info_entity.dart';
import 'package:exam_app/features/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_events.dart';
import 'package:exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_states.dart';
import 'package:exam_app/features/validations/validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class EditProfileCubit extends Cubit<EditProfileStates> {
  final EditProfileUseCase _editProfileUseCase;

  LoggedUserInfoEntity? loggedUser;
  String _originalLastName = '';

  EditProfileCubit(this._editProfileUseCase) : super(const EditProfileStates());

  void doEvents(EditProfileEvents event) {
    switch (event) {
      case GetLoggedUserInfoEvent():
        getLoggedUser();
        break;

      case PutEditProfileEvent():
        _editProfile(event.editProfileRequest);
        break;

      case ChangePasswordEvent():
        _changePassword(event.changePasswordRequest);
        break;
    }
  }

  Future<void> getLoggedUser() async {
    emit(
      state.copyWith(
        loggedUserInfoState: const BaseState.loading(),
        showEditSuccessToast: false,
      ),
    );

    final result = await _editProfileUseCase.getLoggedUserInfo();

    result.when(
      success: (data) {
        loggedUser = data;
        _originalLastName = data?.user?.lastName ?? '';

        emit(
          state.copyWith(
            loggedUserInfoState: BaseState.success(data),
            isProfileChanged: false,
            showEditSuccessToast: false,
          ),
        );
      },
      error: (exception) {
        emit(
          state.copyWith(
            loggedUserInfoState: BaseState.error(exception),
            showEditSuccessToast: false,
          ),
        );
      },
    );
  }

  void onLastNameChanged(String value) {
    final isChanged = value.trim() != _originalLastName.trim();

    if (state.isProfileChanged != isChanged) {
      emit(
        state.copyWith(
          isProfileChanged: isChanged,
          showEditSuccessToast: false,
        ),
      );
    }
  }

  Future<void> updateProfile({required String lastName}) async {
    if (!state.isProfileChanged) return;

    final request = EditProfileRequest(lastName: lastName.trim());

    await _editProfile(request);
  }

  void onPasswordFieldsChanged({
    required String oldPassword,
    required String password,
    required String rePassword,
  }) {
    final isValid =
        Validations.validateLoginPassword(oldPassword) == null &&
        Validations.validatePassword(password) == null &&
        Validations.validatePasswordVerification(rePassword, password) == null;

    if (state.isPasswordFormValid != isValid) {
      emit(
        state.copyWith(
          isPasswordFormValid: isValid,
          showEditSuccessToast: false,
        ),
      );
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String password,
    required String rePassword,
  }) async {
    if (!state.isPasswordFormValid) return;

    final request = ChangePasswordRequest(
      oldPassword: oldPassword.trim(),
      password: password.trim(),
      rePassword: rePassword.trim(),
    );

    await _changePassword(request);
  }

  void clearEditSuccessToast() {
    if (!state.showEditSuccessToast) return;

    emit(state.copyWith(showEditSuccessToast: false));
  }

  Future<void> _editProfile(EditProfileRequest editProfileRequest) async {
    emit(
      state.copyWith(
        editProfileState: const BaseState.loading(),
        showEditSuccessToast: false,
      ),
    );

    final result = await _editProfileUseCase.editProfile(editProfileRequest);

    result.when(
      success: (data) {
        _originalLastName = editProfileRequest.lastName ?? _originalLastName;

        emit(
          state.copyWith(
            editProfileState: BaseState.success(data),
            isProfileChanged: false,
            showEditSuccessToast: true,
          ),
        );
      },
      error: (exception) {
        emit(
          state.copyWith(
            editProfileState: BaseState.error(exception),
            showEditSuccessToast: false,
          ),
        );
      },
    );
  }

  Future<void> _changePassword(ChangePasswordRequest request) async {
    emit(
      state.copyWith(
        changePasswordState: const BaseState.loading(),
        showEditSuccessToast: false,
      ),
    );

    final result = await _editProfileUseCase.changePassword(request);

    result.when(
      success: (data) {
        emit(
          state.copyWith(
            changePasswordState: BaseState.success(data),
            isPasswordFormValid: false,
            showEditSuccessToast: false,
          ),
        );
      },
      error: (exception) {
        emit(
          state.copyWith(
            changePasswordState: BaseState.error(exception),
            showEditSuccessToast: false,
          ),
        );
      },
    );
  }
}
