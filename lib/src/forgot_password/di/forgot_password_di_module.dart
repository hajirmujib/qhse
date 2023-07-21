import 'package:bloc_skeleton/src/forgot_password/data/remote/services/forgot_password_service.dart';
import 'package:bloc_skeleton/src/forgot_password/data/repository/forgot_password_repository.dart';
import 'package:bloc_skeleton/src/forgot_password/data/repository/forgot_password_repository_impl.dart';
import 'package:bloc_skeleton/src/forgot_password/domain/usecases/forgot_password_usecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ForgotPasswordDiModule {
  @singleton
  ForgotPasswordService forgotPasswordService(Dio dio) =>
      ForgotPasswordService(dio);

  @Singleton(as: ForgotPasswordRepository)
  ForgotPasswordRepositoryImpl get forgotPasswordRepository;

  @injectable
  ForgotPasswordUseCase postForgotPasswordUseCase(
          ForgotPasswordRepository repository) =>
      ForgotPasswordUseCase(repository);
}
