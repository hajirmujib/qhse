import 'package:bloc_skeleton/core/data/remote/responses/base_response.dart';
import 'package:bloc_skeleton/src/auth/data/remote/requests/auth_login_request.dart';
import 'package:bloc_skeleton/src/auth/data/remote/responses/auth_user_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) => _AuthService(dio);

  @POST('/login')
  Future<BaseResponse<AuthUserResponse>> login(
      @Body() AuthLoginRequest request);
}
