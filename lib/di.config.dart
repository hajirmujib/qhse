// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_skeleton/core/data/local/app_preferences.dart' as _i6;
import 'package:bloc_skeleton/core/data/remote/interceptors/auth_interceptor.dart'
    as _i3;
import 'package:bloc_skeleton/core/data/remote/interceptors/cookie_interceptor.dart'
    as _i4;
import 'package:bloc_skeleton/core/di/local_module.dart' as _i17;
import 'package:bloc_skeleton/core/di/network_module.dart' as _i18;
import 'package:bloc_skeleton/src/auth/data/remote/services/auth_service.dart'
    as _i10;
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository.dart'
    as _i15;
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository_impl.dart'
    as _i22;
import 'package:bloc_skeleton/src/auth/di/auth_di_module.dart' as _i21;
import 'package:bloc_skeleton/src/auth/domain/usecases/auth_login_usecase.dart'
    as _i16;
import 'package:bloc_skeleton/src/example/data/remote/services/example_service.dart'
    as _i8;
import 'package:bloc_skeleton/src/example/data/repository/example_repository.dart'
    as _i11;
import 'package:bloc_skeleton/src/example/data/repository/example_repository_impl.dart'
    as _i24;
import 'package:bloc_skeleton/src/example/di/example_di_module.dart' as _i23;
import 'package:bloc_skeleton/src/example/domain/usecases/get_post_usecase.dart'
    as _i14;
import 'package:bloc_skeleton/src/forgot_password/data/remote/services/forgot_password_service.dart'
    as _i9;
import 'package:bloc_skeleton/src/forgot_password/data/repository/forgot_password_repository.dart'
    as _i12;
import 'package:bloc_skeleton/src/forgot_password/data/repository/forgot_password_repository_impl.dart'
    as _i20;
import 'package:bloc_skeleton/src/forgot_password/di/forgot_password_di_module.dart'
    as _i19;
import 'package:bloc_skeleton/src/forgot_password/domain/usecases/forgot_password_usecase.dart'
    as _i13;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final localModule = _$LocalModule();
    final exampleDiModule = _$ExampleDiModule(this);
    final forgotPasswordDiModule = _$ForgotPasswordDiModule(this);
    final authDiModule = _$AuthDiModule(this);
    gh.singleton<_i3.AuthInterceptor>(networkModule.authInterceptor);
    gh.singleton<_i4.CookieInterceptor>(networkModule.cookieInterceptor);
    await gh.singletonAsync<_i5.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    gh.singleton<String>(
      networkModule.baseUrl,
      instanceName: 'base_url',
    );
    gh.singleton<_i6.AppPreferences>(
        localModule.appPreferences(gh<_i5.SharedPreferences>()));
    gh.singleton<_i7.Dio>(networkModule.dio(
      gh<String>(instanceName: 'base_url'),
      gh<_i3.AuthInterceptor>(),
      gh<_i4.CookieInterceptor>(),
    ));
    gh.singleton<_i8.ExampleService>(
        exampleDiModule.exampleService(gh<_i7.Dio>()));
    gh.singleton<_i9.ForgotPasswordService>(
        forgotPasswordDiModule.forgotPasswordService(gh<_i7.Dio>()));
    gh.singleton<_i10.AuthService>(authDiModule.authService(gh<_i7.Dio>()));
    gh.singleton<_i11.ExampleRepository>(exampleDiModule.exampleRepository);
    gh.singleton<_i12.ForgotPasswordRepository>(
        forgotPasswordDiModule.forgotPasswordRepository);
    gh.factory<_i13.ForgotPasswordUseCase>(() => forgotPasswordDiModule
        .postForgotPasswordUseCase(gh<_i12.ForgotPasswordRepository>()));
    gh.factory<_i14.GetPostUseCase>(
        () => exampleDiModule.getPostUseCase(gh<_i11.ExampleRepository>()));
    gh.singleton<_i15.AuthRepository>(authDiModule.authRepository);
    gh.factory<_i16.AuthLoginUseCase>(
        () => authDiModule.authLoginUseCase(gh<_i15.AuthRepository>()));
    return this;
  }
}

class _$LocalModule extends _i17.LocalModule {}

class _$NetworkModule extends _i18.NetworkModule {}

class _$ForgotPasswordDiModule extends _i19.ForgotPasswordDiModule {
  _$ForgotPasswordDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i20.ForgotPasswordRepositoryImpl get forgotPasswordRepository =>
      _i20.ForgotPasswordRepositoryImpl(_getIt<_i9.ForgotPasswordService>());
}

class _$AuthDiModule extends _i21.AuthDiModule {
  _$AuthDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i22.AuthRepositoryImpl get authRepository =>
      _i22.AuthRepositoryImpl(_getIt<_i10.AuthService>());
}

class _$ExampleDiModule extends _i23.ExampleDiModule {
  _$ExampleDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i24.ExampleRepositoryImpl get exampleRepository =>
      _i24.ExampleRepositoryImpl(_getIt<_i8.ExampleService>());
}
