
import 'package:exam_app/features/auth/login/data/models/responce/signin_responce_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'signup_responce.g.dart';

Signupresponce signupresponceFromJson(String str) =>
    Signupresponce.fromJson(json.decode(str));

String signupresponceToJson(Signupresponce data) => json.encode(data.toJson());

@JsonSerializable()
class Signupresponce {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  Dto? user;

  Signupresponce({this.message, this.token, this.user});

  factory Signupresponce.fromJson(Map<String, dynamic> json) =>
      _$SignupresponceFromJson(json);

  Map<String, dynamic> toJson() => _$SignupresponceToJson(this);
}
