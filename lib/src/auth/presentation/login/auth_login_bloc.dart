import 'package:bloc/bloc.dart';
import 'package:bloc_skeleton/core/data/local/app_preferences.dart';
import 'package:bloc_skeleton/core/domain/models/error_dto.dart';
import 'package:bloc_skeleton/src/auth/data/remote/requests/auth_login_request.dart';
import 'package:bloc_skeleton/src/auth/domain/models/auth_user_dto.dart';
import 'package:bloc_skeleton/src/auth/domain/usecases/auth_login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'auth_login_event.dart';
part 'auth_login_state.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  final AuthLoginUseCase authLoginUseCase;
  final AppPreferences preferences;

  var stateData = const AuthLoginStateData();

  AuthLoginBloc({required this.preferences, required this.authLoginUseCase})
      : super(const AuthLoginInitialState()) {
    on<AuthLoginInitEvent>(_onInitAuthLogin);
    on<AuthLoginProceedEvent>(_onLoginProceed);
  }

  void _onInitAuthLogin(
    AuthLoginInitEvent event,
    Emitter<AuthLoginState> emit,
  ) {
    emit(const AuthLoginInitialState());
  }

  String getSavedNIK() {
    return preferences.getUsername() ?? '';
  }

  String getSavedPassword() {
    return preferences.getPassword() ?? '';
  }

 

  void _onLoginProceed(
    AuthLoginProceedEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    emit(AuthLoginLoadingState(stateData));
    if (event.isPasswordSaved) {
      await preferences.setUsername(event.email);
      await preferences.setPassword(event.password);
    } else {
      await preferences.setUsername("");
      await preferences.setPassword("");
    }

    var request = AuthLoginRequest(
      nik: event.email,
      password: event.password,
    );

    var result = await authLoginUseCase.execute(request);

    result.fold((ErrorDto error) {
      emit(AuthLoginFailedState(stateData.copyWith(error: error)));
    }, (AuthUserDto user) {
      preferences.setUserId(user.id);
      preferences.setRoleId(user.role);

      preferences.setName(user.name);
      preferences.setNik(user.nik);
      preferences.setProjectSite(user.siteLocation);
      emit(
        AuthLoginSuccessState(
          stateData.copyWith(
            user: user,
            error: null,
          ),
        ),
      );
    });
  }
}
