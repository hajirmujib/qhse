part of 'forgot_password_bloc.dart';

/// State data
class ForgotPasswordStateData extends Equatable {
  final ErrorDto? error;

  const ForgotPasswordStateData({
    this.error,
  });

  ForgotPasswordStateData copyWith({
    List<ForgotPasswordDto>? forgotPasswordDto,
    ErrorDto? error,
  }) {
    return ForgotPasswordStateData(
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [error];
}

/// State
abstract class ForgotPasswordState extends Equatable {
  final ForgotPasswordStateData data;

  const ForgotPasswordState(this.data);
}

class ForgotPasswordInitialState extends ForgotPasswordState {
  const ForgotPasswordInitialState() : super(const ForgotPasswordStateData());

  @override
  List<Object> get props => [super.data];
}

class ForgotPasswordLoadingState extends ForgotPasswordState {
  const ForgotPasswordLoadingState(super.data);

  @override
  List<Object> get props => [super.data];
}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  const ForgotPasswordSuccessState(super.data);

  @override
  List<Object> get props => [super.data];
}

class ForgotPasswordErrorState extends ForgotPasswordState {
  const ForgotPasswordErrorState(super.data);

  @override
  List<Object> get props => [super.data];
}
