// TODO: presentation Forget_passwordEvents
sealed class ForgetPasswordEvents {}

final class ObscureTextChangedEvent extends ForgetPasswordEvents {
  final String fieldKey;
  ObscureTextChangedEvent(this.fieldKey);
}

final class EmailFormValidChangedEvent extends ForgetPasswordEvents {
  final bool isValid;
  EmailFormValidChangedEvent(this.isValid);
}

final class CodeFormValidChangedEvent extends ForgetPasswordEvents {
  final bool isValid;
  CodeFormValidChangedEvent(this.isValid);
}

final class ResetFormValidChangedEvent extends ForgetPasswordEvents {
  final bool isValid;
  ResetFormValidChangedEvent(this.isValid);
}

final class NextPageEvent extends ForgetPasswordEvents {}

class SendCodeToEmailEvent extends ForgetPasswordEvents {
  final String email;
  SendCodeToEmailEvent(this.email);
}

class VerifyCodeEvent extends ForgetPasswordEvents {
  final String code;
  VerifyCodeEvent(this.code);
}

class ResetPasswordEvent extends ForgetPasswordEvents {
  final String email;
  final String password;
  ResetPasswordEvent({required this.email, required this.password});
}

class ResendCodeToEmailEvent extends ForgetPasswordEvents {
  final String email;
  ResendCodeToEmailEvent(this.email);
}
