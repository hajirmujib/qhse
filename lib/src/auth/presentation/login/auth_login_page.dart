import 'package:bloc_skeleton/common_ui/widgets/common_button.dart';
import 'package:bloc_skeleton/core/data/local/app_preferences.dart';
import 'package:bloc_skeleton/src/auth/presentation/login/auth_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AuthLoginPage extends StatefulWidget {
  static const route = '/auth/login';

  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  @override
  AppPreferences? prefs;

  late AuthLoginBloc _bloc;
  final inputFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void initState() {
    _bloc = AuthLoginBloc(
      preferences: GetIt.instance(),
      authLoginUseCase: GetIt.instance(),
    )..add(AuthLoginInitEvent());

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    prefs = GetIt.instance<AppPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthLoginBloc, AuthLoginState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is AuthLoginLoadingState) {
              print('Loaded!!');
            } else if (state is AuthLoginSuccessState) {
              print('Success!!');
            } else if (state is AuthLoginFailedState) {
              print('Failed! ! ${state.data.error?.errorType}');
            }
          },
          builder: (context, state) {
            return Form(
              key: inputFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 104),
                  SizedBox(
                    width: width,
                    height: 50,
                    child: TextField(controller: emailController),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: width,
                    height: 50,
                    child: TextField(controller: passController),
                  ),
                  const SizedBox(height: 16),
                  CommonButton(
                    onPressed: onLogin,
                    text: 'Login',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void onLogin() {
    if (inputFormKey.currentState?.validate() == true) {
      print('e : ${emailController.text}||${passController.text}');
      _bloc.add(
        AuthLoginProceedEvent(
            email: emailController.text,
            password: passController.text,
            isPasswordSaved: false),
      );
    }
  }
}
