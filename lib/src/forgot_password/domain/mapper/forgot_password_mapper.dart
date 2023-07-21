import 'package:bloc_skeleton/src/forgot_password/data/remote/responses/forgot_password_response.dart';
import 'package:bloc_skeleton/src/forgot_password/domain/models/forgot_password_dto.dart';

extension PostResponseExt on ForgotPasswordResponse? {
  ForgotPasswordDto toDto() {
    return ForgotPasswordDto(
      status: this?.status ?? false,
    );
  }
}
