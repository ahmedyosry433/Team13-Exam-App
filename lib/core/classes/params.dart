import 'package:equatable/equatable.dart';

class ForgetPasswordRequest extends Equatable {
  final String? email;
  final String? code;
  final String? newPassword;

  const ForgetPasswordRequest({this.email, this.code, this.newPassword});

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordRequest(
        email: json['email'] as String?,
        code: json['resetCode'] as String?,
        newPassword: json['newPassword'] as String?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (email != null) data['email'] = email;
    if (code != null) data['resetCode'] = code;
    if (newPassword != null) data['newPassword'] = newPassword;
    return data;
  }

  ForgetPasswordRequest copyWith({
    String? email,
    String? code,
    String? newPassword,
  }) {
    return ForgetPasswordRequest(
      email: email ?? this.email,
      code: code ?? this.code,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  @override
  List<Object?> get props => [email, code, newPassword];
}
