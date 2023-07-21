import 'package:bloc_skeleton/core/data/remote/responses/base_response.dart';
import 'package:bloc_skeleton/src/forgot_password/data/remote/request/forgot_password_request.dart';
import 'package:bloc_skeleton/src/forgot_password/data/remote/responses/forgot_password_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'forgot_password_service.g.dart';

@RestApi()
abstract class ForgotPasswordService {
  factory ForgotPasswordService(Dio dio) => _ForgotPasswordService(dio);

  @POST('/forgot_password')
  Future<BaseResponse<ForgotPasswordResponse>> postForgotPassword(
      ForgotPasswordRequest request);
}
