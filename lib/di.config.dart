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
import 'package:bloc_skeleton/core/di/local_module.dart' as _i14;
import 'package:bloc_skeleton/core/di/network_module.dart' as _i15;
import 'package:bloc_skeleton/src/auth/data/remote/services/auth_service.dart'
    as _i9;
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository.dart'
    as _i12;
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository_impl.dart'
    as _i17;
import 'package:bloc_skeleton/src/auth/di/auth_di_module.dart' as _i16;
import 'package:bloc_skeleton/src/auth/domain/usecases/auth_login_usecase.dart'
    as _i13;
import 'package:bloc_skeleton/src/example/data/remote/services/example_service.dart'
    as _i8;
import 'package:bloc_skeleton/src/example/data/repository/example_repository.dart'
    as _i10;
import 'package:bloc_skeleton/src/example/data/repository/example_repository_impl.dart'
    as _i19;
import 'package:bloc_skeleton/src/example/di/example_di_module.dart' as _i18;
import 'package:bloc_skeleton/src/example/domain/usecases/get_post_usecase.dart'
    as _i11;
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
    gh.singleton<_i9.AuthService>(authDiModule.authService(gh<_i7.Dio>()));
    gh.singleton<_i10.ExampleRepository>(exampleDiModule.exampleRepository);
    gh.factory<_i11.GetPostUseCase>(
        () => exampleDiModule.getPostUseCase(gh<_i10.ExampleRepository>()));
    gh.singleton<_i12.AuthRepository>(authDiModule.authRepository);
    gh.factory<_i13.AuthLoginUseCase>(
        () => authDiModule.authLoginUseCase(gh<_i12.AuthRepository>()));
    return this;
  }
}

class _$LocalModule extends _i14.LocalModule {}

class _$NetworkModule extends _i15.NetworkModule {}

class _$AuthDiModule extends _i16.AuthDiModule {
  _$AuthDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i17.AuthRepositoryImpl get authRepository =>
      _i17.AuthRepositoryImpl(_getIt<_i9.AuthService>());
}

class _$ExampleDiModule extends _i18.ExampleDiModule {
  _$ExampleDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i19.ExampleRepositoryImpl get exampleRepository =>
      _i19.ExampleRepositoryImpl(_getIt<_i8.ExampleService>());
}
