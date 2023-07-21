import 'package:bloc/bloc.dart';
import 'package:bloc_skeleton/core/domain/models/error_dto.dart';
import 'package:bloc_skeleton/src/forgot_password/domain/models/forgot_password_dto.dart';
import 'package:bloc_skeleton/src/forgot_password/domain/usecases/forgot_password_usecase.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

/// Bloc
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordStateData stateData = const ForgotPasswordStateData();

  ForgotPasswordBloc({
    required this.forgotPasswordUseCase,
  }) : super(const ForgotPasswordInitialState()) {
    on<ForgotPasswordInitEvent>(_onInitForgotPassword);

    on<ForgotPasswordProcessedEvent>(_forgotPasswordProcessedEvent);
  }

  

  void _onInitForgotPassword(
    ForgotPasswordInitEvent event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(const ForgotPasswordInitialState());
  }

  //check if 1 day fail 3 time sign in
  //get fail sign in
  //get day
  //--> reset fail count if yesterday found count
  //<-- add fail count <3
  //-->
  void _forgotPasswordProcessedEvent(
    ForgotPasswordProcessedEvent event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(ForgotPasswordLoadingState(stateData));

    emit(ForgotPasswordSuccessState(stateData));
  }
}
