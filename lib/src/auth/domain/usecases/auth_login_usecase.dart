import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:bloc_skeleton/src/auth/data/remote/requests/auth_login_request.dart';
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository.dart';
import 'package:bloc_skeleton/src/auth/domain/mapper/auth_mapper.dart';
import 'package:bloc_skeleton/src/auth/domain/models/auth_user_dto.dart';
import 'package:either_dart/either.dart';

class AuthLoginUseCase {
  final AuthRepository _repository;

  AuthLoginUseCase(this._repository);

  FutureOrError<AuthUserDto> execute(AuthLoginRequest request) {
    return _repository
        .login(request)
        .mapRight((response) => response.data.toDto());
  }
}
