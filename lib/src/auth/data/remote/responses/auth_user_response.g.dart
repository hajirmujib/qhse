// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserResponse _$AuthUserResponseFromJson(Map<String, dynamic> json) =>
    AuthUserResponse(
      id: json['user_id'] as String?,
      name: json['name'] as String?,
      systemRoleId: json['system_role_id'] as int?,
      nik: json['nik'] as String?,
      departement: json['departement'] as String?,
      siteLocation: json['site_location'] as String?,
    );

Map<String, dynamic> _$AuthUserResponseToJson(AuthUserResponse instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'name': instance.name,
      'system_role_id': instance.systemRoleId,
      'nik': instance.nik,
      'departement': instance.departement,
      'site_location': instance.siteLocation,
    };
