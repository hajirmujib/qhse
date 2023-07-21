import 'package:bloc_skeleton/core/data/remote/responses/base_response.dart';
import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:bloc_skeleton/src/forgot_password/data/remote/request/forgot_password_request.dart';
import 'package:bloc_skeleton/src/forgot_password/data/remote/responses/forgot_password_response.dart';

abstract class ForgotPasswordRepository {
  FutureOrError<BaseResponse<ForgotPasswordResponse>> postForgotPassword(
    ForgotPasswordRequest request,
  );
}
