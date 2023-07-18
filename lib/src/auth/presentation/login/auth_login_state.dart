part of 'auth_login_bloc.dart';

/// State data
class AuthLoginStateData extends Equatable {
  final AuthUserDto user;
  final ErrorDto? error;

  const AuthLoginStateData({
    this.user = const AuthUserDto(),
    this.error,
  });

  @override
  List<Object?> get props => [error, user];

  AuthLoginStateData copyWith({
    AuthUserDto? user,
    ErrorDto? error,
  }) {
    return AuthLoginStateData(
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

/// State
abstract class AuthLoginState extends Equatable {
  final AuthLoginStateData data;

  const AuthLoginState(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLoginInitialState extends AuthLoginState {
  const AuthLoginInitialState() : super(const AuthLoginStateData());
}

class AuthLoginLoadingState extends AuthLoginState {
  const AuthLoginLoadingState(super.data);
}

class AuthLoginSuccessState extends AuthLoginState {
  const AuthLoginSuccessState(super.data);
}

class AuthLoginFailedState extends AuthLoginState {
  const AuthLoginFailedState(super.data);
}
