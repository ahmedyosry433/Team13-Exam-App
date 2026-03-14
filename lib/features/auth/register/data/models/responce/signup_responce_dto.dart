import 'package:exam_app/features/auth/register/domain/entity/register_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_responce_dto.g.dart';

@JsonSerializable()
class Dto {
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  Dto({
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
  
  SignupEntity toDomain() => SignupEntity(
        username: username ?? '',
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        email: email ?? '',
        phone: phone ?? '',
        role: role ?? '',
        isVerified: isVerified ?? false,
        id: id ?? '',
        createdAt: createdAt ?? DateTime.now(),
      );

  factory Dto.fromJson(Map<String, dynamic> json) => _$DtoFromJson(json);

  Map<String, dynamic> toJson() => _$DtoToJson(this);
}
