
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'signup_request.g.dart';

SignupRequest signupRequestFromJson(String str) => SignupRequest.fromJson(json.decode(str));

String signupRequestToJson(SignupRequest data) => json.encode(data.toJson());

@JsonSerializable()
class SignupRequest {
    @JsonKey(name: "username")
    String? username;
    @JsonKey(name: "firstName")
    String? firstName;
    @JsonKey(name: "lastName")
    String? lastName;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "rePassword")
    String? rePassword;
    @JsonKey(name: "phone")
    String? phone;

    SignupRequest({
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.rePassword,
        this.phone,
    });

    factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);

    Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
