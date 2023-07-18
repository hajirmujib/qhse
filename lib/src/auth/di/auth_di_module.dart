import 'package:bloc_skeleton/src/auth/data/remote/services/auth_service.dart';
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository.dart';
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository_impl.dart';
import 'package:bloc_skeleton/src/auth/domain/usecases/auth_login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthDiModule {
  @singleton
  AuthService authService(Dio dio) => AuthService(dio);

  @Singleton(as: AuthRepository)
  AuthRepositoryImpl get authRepository;

  @injectable
  AuthLoginUseCase authLoginUseCase(AuthRepository repository) =>
      AuthLoginUseCase(repository);
}
