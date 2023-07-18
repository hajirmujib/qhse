import 'package:json_annotation/json_annotation.dart';

part 'auth_login_request.g.dart';

@JsonSerializable()
class AuthLoginRequest {
  @JsonKey(name: 'nik')
  String? nik;
  @JsonKey(name: 'password')
  String? password;

  AuthLoginRequest({
    this.nik,
    this.password,
  });

  Map<String, dynamic> toJson() => _$AuthLoginRequestToJson(this);
}
