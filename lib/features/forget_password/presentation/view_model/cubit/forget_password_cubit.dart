// TODO: presentation Forget_passwordCubit
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/core/classes/params.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/features/forget_password/domain/use_cases/send_otp_use_case.dart';
import 'package:exam_app/features/forget_password/domain/use_cases/reset_password_use_case.dart';
import 'package:exam_app/features/forget_password/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:exam_app/features/forget_password/presentation/view_model/cubit/forget_password_events.dart';
import 'package:exam_app/features/forget_password/presentation/view_model/cubit/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit(
    this._sendOtpUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(const ForgetPasswordStates());

  final SendOtpUseCase _sendOtpUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  //!=========================== Event =========================================
  void doIndented(ForgetPasswordEvents event) {
    switch (event) {
      case EmailFormValidChangedEvent():
        _emailFormValidChanged(event.isValid);
      case CodeFormValidChangedEvent():
        _codeFormValidChanged(event.isValid);
      case ResetFormValidChangedEvent():
        _resetPasswordFormValidChanged(event.isValid);
      case NextPageEvent():
        _nextPage();
      case ObscureTextChangedEvent():
        _obscureTextChanged(event.fieldKey);
      case SendCodeToEmailEvent():
        _sendOtp(event.email);
      case ResendCodeToEmailEvent():
        resendCode(event.email);
      case VerifyCodeEvent():
        _verifyResetCode(event.code);
      case ResetPasswordEvent():
        _resetPassword(email: event.email, password: event.password);
    }
  }

  // ! Form Reset Valid Changed
  void _resetPasswordFormValidChanged(bool isValid) {
    if (!isValid) {
      emit(
        state.copyWith(
          resetPasswordState: const ResetPasswordState(
            state: StateType.initial,
          ),
        ),
      );
    }
    emit(
      state.copyWith(
        resetPasswordFormValidChangedState: FormValidChangedState(
          isValid: isValid,
        ),
      ),
    );
  }

  // ! Form email Valid Changed
  void _emailFormValidChanged(bool isValid) {
    if (!isValid) {
      emit(
        state.copyWith(
          sendCodeToEmailState: const SendCodeToEmailState(
            state: StateType.initial,
          ),
        ),
      );
    }
    emit(
      state.copyWith(
        emailFormValidChangedState: FormValidChangedState(isValid: isValid),
      ),
    );
  }

  // ! Form Code Valid Changed
  void _codeFormValidChanged(bool isValid) {
    if (!isValid) {
      emit(
        state.copyWith(
          verifyCodeState: const VerifyCodeState(state: StateType.initial),
          resendCodeToEmailState: const ResendCodeToEmailState(
            state: StateType.initial,
          ),
          sendCodeToEmailState: const SendCodeToEmailState(
            state: StateType.initial,
          ),
        ),
      );
    }
    emit(
      state.copyWith(
        codeFormValidChangedState: FormValidChangedState(isValid: isValid),
      ),
    );
  }

  //!=========================== Methods =========================================
  // ! sendOtp
  Future<void> _sendOtp(String email) async {
    emit(
      state.copyWith(
        sendCodeToEmailState: const SendCodeToEmailState(
          state: StateType.loading,
        ),
      ),
    );
    final result = await _sendOtpUseCase(ForgetPasswordParams(email: email));

    result.when(
      success: (value) {
        emit(
          state.copyWith(
            storedEmail: email,
            sendCodeToEmailState: const SendCodeToEmailState(
              state: StateType.success,
            ),
          ),
        );
      },
      error: (exception) {
        emit(
          state.copyWith(
            sendCodeToEmailState: SendCodeToEmailState(
              state: StateType.error,
              exception: exception,
            ),
          ),
        );
      },
    );
  }

  // ! verifyResetCode
  Future<void> _verifyResetCode(String code) async {
    emit(
      state.copyWith(
        resendCodeToEmailState: const ResendCodeToEmailState(
          state: StateType.initial,
        ),
      ),
    );
    emit(
      state.copyWith(
        verifyCodeState: const VerifyCodeState(state: StateType.loading),
      ),
    );

    final result = await _verifyResetCodeUseCase(
      ForgetPasswordParams(code: code),
    );

    result.when(
      success: (value) {
        emit(
          state.copyWith(
            verifyCodeState: const VerifyCodeState(state: StateType.success),
          ),
        );
      },
      error: (exception) {
        emit(
          state.copyWith(
            verifyCodeState: VerifyCodeState(
              state: StateType.error,
              exception: exception,
            ),
          ),
        );
      },
    );
  }

  // ! resetPassword
  Future<void> _resetPassword({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        resetPasswordState: const ResetPasswordState(state: StateType.loading),
      ),
    );
    final result = await _resetPasswordUseCase(
      ForgetPasswordParams(email: email, newPassword: password),
    );

    result.when(
      success: (value) {
        emit(
          state.copyWith(
            resetPasswordState: const ResetPasswordState(
              state: StateType.success,
            ),
          ),
        );
      },
      error: (exception) {
        emit(
          state.copyWith(
            resetPasswordState: ResetPasswordState(
              state: StateType.error,
              exception: exception,
            ),
          ),
        );
      },
    );
  }

  //! resend code use case
  Future<void> resendCode(String email) async {
    emit(
      state.copyWith(
        verifyCodeState: const VerifyCodeState(state: StateType.initial),
      ),
    );
    emit(
      state.copyWith(
        resendCodeToEmailState: const ResendCodeToEmailState(
          state: StateType.loading,
        ),
      ),
    );
    final result = await _sendOtpUseCase(ForgetPasswordParams(email: email));

    result.when(
      success: (value) {
        emit(
          state.copyWith(
            resendCodeToEmailState: const ResendCodeToEmailState(
              state: StateType.success,
            ),
          ),
        );
      },
      error: (exception) {
        emit(
          state.copyWith(
            resendCodeToEmailState: ResendCodeToEmailState(
              state: StateType.error,
              exception: exception,
            ),
          ),
        );
      },
    );
  }

  // ! Obscure Text Changed
  void _obscureTextChanged(String fieldType) {
    if (fieldType == LocaleKeys.forget_password_new_password) {
      bool isObscure =
          !(state.obscureNewPasswordTextChangedState?.isObscure ?? true);
      emit(
        state.copyWith(
          obscureNewPasswordTextChangedState: ObscureTextChangedState(
            isObscure: isObscure,
          ),
        ),
      );
    } else if (fieldType == LocaleKeys.forget_password_confirm_password) {
      bool isObscure =
          !(state.obscureConfirmNewPasswordTextChangedState?.isObscure ?? true);
      emit(
        state.copyWith(
          obscureConfirmNewPasswordTextChangedState: ObscureTextChangedState(
            isObscure: isObscure,
          ),
        ),
      );
    }
  }

  // ! Next Page
  void _nextPage() {
    emit(
      state.copyWith(
        nextPageState: NextPageState(
          currentPage: state.nextPageState!.currentPage + 1,
        ),
      ),
    );
  }

  @override
  void emit(ForgetPasswordStates state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
