import 'package:equatable/equatable.dart';

class SigninEntity extends Equatable {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? id;
  final DateTime? createdAt;

  SigninEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  String? get token => null;
  
  @override
  List<Object?> get props => [
        username,
        firstName,
        lastName,
        email,
        phone,
        role,
        isVerified,
        id,
        createdAt,
      ];
}