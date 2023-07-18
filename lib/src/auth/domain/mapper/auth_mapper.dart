import 'package:bloc_skeleton/src/auth/data/remote/responses/auth_user_response.dart';
import 'package:bloc_skeleton/src/auth/domain/models/auth_user_dto.dart';

extension AuthUserExt on AuthUserResponse? {
  AuthUserDto toDto() {
    return AuthUserDto(
      id: this?.id ?? '',
      name: this?.name ?? '',
      role: this?.systemRoleId ?? 0,
      siteLocation: this?.siteLocation ?? '',
      nik: this?.nik ?? ''
    );
  }
}
