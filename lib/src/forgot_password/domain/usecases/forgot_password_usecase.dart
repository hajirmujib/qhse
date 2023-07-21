import 'package:bloc_skeleton/core/data/remote/responses/base_response.dart';
import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:bloc_skeleton/src/forgot_password/data/remote/request/forgot_password_request.dart';
import 'package:bloc_skeleton/src/forgot_password/data/remote/responses/forgot_password_response.dart';
import 'package:bloc_skeleton/src/forgot_password/data/repository/forgot_password_repository.dart';
import 'package:either_dart/either.dart';

class ForgotPasswordUseCase {
  final ForgotPasswordRepository repository;

  ForgotPasswordUseCase(this.repository);

  FutureOrError<BaseResponse<ForgotPasswordResponse>> execute(
      ForgotPasswordRequest request) {
    return repository.postForgotPassword(request).mapRight((data) => data);
  }
}
