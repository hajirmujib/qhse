part of 'auth_login_bloc.dart';

/// Event
abstract class AuthLoginEvent extends Equatable {
  const AuthLoginEvent();
}

class AuthLoginInitEvent extends AuthLoginEvent {
  @override
  List<Object?> get props => [];
}

class AuthLoginProceedEvent extends AuthLoginEvent {
  final String email;
  final String password;
  final bool isPasswordSaved;

  const AuthLoginProceedEvent(
      {required this.email,
      required this.password,
      required this.isPasswordSaved});

  @override
  List<Object?> get props => [email, password];
}
