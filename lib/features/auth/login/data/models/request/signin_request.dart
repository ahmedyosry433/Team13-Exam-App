
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'signin_request.g.dart';

SigninRequest signinRequestFromJson(String str) => SigninRequest.fromJson(json.decode(str));

String signinRequestToJson(SigninRequest data) => json.encode(data.toJson());

@JsonSerializable()
class SigninRequest {
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "password")
    String? password;

    SigninRequest({
        this.email,
        this.password,
    });

    factory SigninRequest.fromJson(Map<String, dynamic> json) => _$SigninRequestFromJson(json);

    Map<String, dynamic> toJson() => _$SigninRequestToJson(this);
}
