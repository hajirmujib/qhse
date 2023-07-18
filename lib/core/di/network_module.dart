import 'package:bloc_skeleton/core/data/remote/interceptors/auth_interceptor.dart';
import 'package:bloc_skeleton/core/data/remote/interceptors/cookie_interceptor.dart';
import 'package:bloc_skeleton/core/utils/date_time_util.dart';
import 'package:bloc_skeleton/flavors.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('base_url')
  @singleton
  String get baseUrl => F.baseUrl;

  @singleton
  AuthInterceptor get authInterceptor => AuthInterceptor();

  @singleton
  CookieInterceptor get cookieInterceptor => CookieInterceptor();

  @singleton
  Dio dio(
    @Named('base_url') String baseUrl,
    AuthInterceptor authInterceptor,
    CookieInterceptor cookieInterceptor,
  ) {
    var option = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: DateTimeUtil.fifteenSeconds),
      sendTimeout: const Duration(seconds: DateTimeUtil.fifteenSeconds),
      receiveTimeout: const Duration(seconds: DateTimeUtil.thirtySecond),
    );

    var headers = <String, dynamic>{
      "Content-Type": "application/json",
    };

    var dio = Dio(option);
    dio.options.headers = headers;
    dio.interceptors.add(authInterceptor);
    dio.interceptors.add(cookieInterceptor);

    return dio;
  }
}
