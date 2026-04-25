class UserEditProfileEntity {
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final String? password;
  final bool? isVerified;
  final DateTime? createdAt;
  final String? passwordResetCode;
  final DateTime? passwordResetExpires;
  final bool? resetCodeVerified;

  UserEditProfileEntity({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
  });
}
