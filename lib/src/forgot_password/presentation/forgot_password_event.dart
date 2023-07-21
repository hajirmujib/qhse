part of 'forgot_password_bloc.dart';

/// Event
abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class ForgotPasswordInitEvent extends ForgotPasswordEvent {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordProcessedEvent extends ForgotPasswordEvent {
  final String email;

  const ForgotPasswordProcessedEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}
