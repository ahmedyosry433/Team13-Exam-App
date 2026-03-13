import 'package:exam_app/features/auth/login/data/models/responce/signin_responce_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'signin_responce.g.dart';

SigninResponse signinresponceFromJson(String str) =>
    SigninResponse.fromJson(json.decode(str));

String signinresponceToJson(SigninResponse data) => json.encode(data.toJson());

@JsonSerializable()
class SigninResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  Dto? user;

  SigninResponse({this.message, this.token, this.user});

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}
