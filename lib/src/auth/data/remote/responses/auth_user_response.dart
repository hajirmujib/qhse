import 'package:json_annotation/json_annotation.dart';

part 'auth_user_response.g.dart';

@JsonSerializable()
class AuthUserResponse {
  @JsonKey(name: 'user_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'system_role_id')
  final int? systemRoleId;
  @JsonKey(name: 'nik')
  final String? nik;
  @JsonKey(name: 'departement')
  final String? departement;
  @JsonKey(name: 'site_location')
  final String? siteLocation;

  factory AuthUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthUserResponseFromJson(json);

  const AuthUserResponse({
    this.id,
    this.name,
    this.systemRoleId,
    this.nik,
    this.departement,
    this.siteLocation,
  });
}
