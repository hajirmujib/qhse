import 'package:bloc_skeleton/core/data/remote/responses/base_response.dart';
import 'package:bloc_skeleton/core/utils/future_util.dart';
import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:bloc_skeleton/src/forgot_password/data/remote/request/forgot_password_request.dart';
import 'package:bloc_skeleton/src/forgot_password/data/remote/responses/forgot_password_response.dart';
import 'package:bloc_skeleton/src/forgot_password/data/remote/services/forgot_password_service.dart';
import 'package:bloc_skeleton/src/forgot_password/data/repository/forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  final ForgotPasswordService forgotPasswordService;

  ForgotPasswordRepositoryImpl(this.forgotPasswordService);

  @override
  FutureOrError<BaseResponse<ForgotPasswordResponse>> postForgotPassword(ForgotPasswordRequest request) {
    return callOrError(() => forgotPasswordService.postForgotPassword(request));
  }

  // @override
  // FutureOrError<BaseResponse<ForgotPasswordResponse>> postForgotPassword(ForgotPasswordRequest request) {
  //   return callOrError(() => forgotPasswordService.postForgotPassword(request));
  // }
}
