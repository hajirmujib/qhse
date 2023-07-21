import 'package:bloc_skeleton/common_ui/button/PrimaryButtonTextOnly.dart';
import 'package:bloc_skeleton/common_ui/checkbox/common_checkbox_widget.dart';
import 'package:bloc_skeleton/common_ui/colors.dart';
import 'package:bloc_skeleton/common_ui/common_icons.dart';
import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/common_ui/dialogs/common_dialogs.dart';
import 'package:bloc_skeleton/common_ui/styles/radius.dart';
import 'package:bloc_skeleton/common_ui/widgets/common_row_logo_text.dart';
import 'package:bloc_skeleton/common_ui/widgets/common_textfield.dart';
import 'package:bloc_skeleton/core/data/local/app_preferences.dart';
import 'package:bloc_skeleton/core/utils/empty_padding.dart';
import 'package:bloc_skeleton/src/auth/presentation/copy_right.dart';
import 'package:bloc_skeleton/src/auth/presentation/login/auth_login_bloc.dart';
import 'package:bloc_skeleton/src/forgot_password/presentation/forgot_password_page.dart';
import 'package:bloc_skeleton/src/main/presentation/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class AuthLoginPage extends StatefulWidget {
  static const route = '/auth/login';

  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  AppPreferences? prefs;

  late AuthLoginBloc _bloc;
  final inputFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool _rememberMe = false;
  bool _isShowPassword = false;
  bool _isValid = false;

  @override
  void initState() {
    _bloc = AuthLoginBloc(
      preferences: GetIt.instance(),
      authLoginUseCase: GetIt.instance(),
    )..add(AuthLoginInitEvent());
    if (_bloc.getSavedNIK().isNotEmpty) {
      _rememberMe = true;
    }
    emailController.addListener(() {
      _isValid =
          emailController.text.isNotEmpty && passController.text.isNotEmpty;
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    prefs = GetIt.instance<AppPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: BlocConsumer<AuthLoginBloc, AuthLoginState>(
              bloc: _bloc,
              listener: (context, state) {
                if (state is AuthLoginLoadingState) {
                  showLoadingDialog();
                } else if (state is AuthLoginSuccessState) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    MainPage.route,
                    (route) => false,
                  );
                } else if (state is AuthLoginFailedState) {
                  Navigator.of(context).pop();
                  CommonDialogs.showToastMessage(state.data.error?.message);
                }
              },
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  height: height,
                  child: Form(
                    key: inputFormKey,
                    child: Column(
                      children: [
                        48.ph,
                        const RowLogoText(
                          text: "Welcome to QHSE Auto,\nplease sign in!",
                        ),
                        48.ph,
                        CommonTextField(
                          formHeight: 45,
                          label: 'NIK',
                          labelTextStyle: CommonTypography.textH8.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryText),
                          controller: emailController,
                          hint: 'Enter your NIK',
                          maxLine: 1,
                          inputType: TextInputType.emailAddress,
                          defaultValue: _bloc.getSavedNIK(),
                          inputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9]')),
                            UpperCaseTextFormatter()
                          ],
                          validators: const [CommonTextFieldValidator.noEmpty],
                          radius: 8,
                        ),
                        12.ph,
                        CommonTextField(
                          formHeight: 44,
                          label: 'Password',
                          labelTextStyle: CommonTypography.textH8.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryText),
                          controller: passController,
                          hint: 'Enter your Password',
                          defaultValue: _bloc.getSavedPassword(),
                          // padding: const EdgeInsets.symmetric(horizontal: 28),
                          inputAction: TextInputAction.done,
                          isObscureText: true,
                          isShowObscuredText: _isShowPassword,
                          onSuffixClick: onPasswordToggleClick,
                          validators: const [
                            CommonTextFieldValidator.noEmpty,
                          ],
                          radius: 8,
                        ),
                        6.ph,
                        CommonCheckboxWidget(
                            textStyle: CommonTypography.textH8.copyWith(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w400),
                            title: "Remember me",
                            value: _rememberMe,
                            onChanged: (val) {
                              setState(() {
                                _rememberMe = val;
                              });
                            }),
                        40.ph,
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: PrimaryButtonTextOnly(
                                  // customHeight: 40,
                                  // customWidth: double.infinity,
                                  borderRadius: 8,
                                  fontSize: 14,
                                  backgroundColor: AppColors.madhaniBlue,
                                  isActive: true,
                                  label: 'Sign In',
                                  onTap: onLogin,
                                  icon: CommonIcons.iconLogin,
                                ),
                              ),
                            ),
                            6.pw,
                            InkWell(
                              onTap: _onLoginWithFingerprint,
                              child: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: AppRadius.lg,
                                    border: Border.all(
                                        color: AppColors.madhaniBlue)),
                                child: CommonIcons.finger,
                              ),
                            ),
                          ],
                        ),
                        40.ph,
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ForgotPasswordPage.route);
                          },
                          child: Text(
                            "Forgot your password?",
                            style: CommonTypography.textH7.copyWith(
                                color: AppColors.madhaniGrey,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        // const Spacer(),
                        // 6.ph,
                        50.ph,

                        const CopyRight(),
                        20.ph
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void showLoadingDialog() {
    CommonDialogs.showLoadingDialog(context);
  }

  void onPasswordToggleClick(bool isShow) {
    setState(() {
      _isShowPassword = isShow;
    });
  }

  void onLogin() {
    FocusScope.of(context).unfocus();
    if (inputFormKey.currentState?.validate() == true) {
      print('e : ${emailController.text}||${passController.text}');
      _bloc.add(
        AuthLoginProceedEvent(
            email: emailController.text,
            password: passController.text,
            isPasswordSaved: _rememberMe),
      );
    }
  }

  Future<void> _onLoginWithFingerprint() async {
    var localAuth = LocalAuthentication();

    var canCheckBiometrics = await localAuth.canCheckBiometrics;
    var canAuthenticate =
        canCheckBiometrics || await localAuth.isDeviceSupported();

    if (!canAuthenticate) {
      CommonDialogs.showToastMessage(
          "Unable to use biometrics with this devices");
      return;
    }

    // showModalBottomSheet(
    //   context: context,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(16.0),
    //       topRight: Radius.circular(16.0),
    //     ),
    //   ),
    //   isDismissible: false,
    //   builder: (BuildContext context) {
    //     // return buildFingerPrintLogin();
    //     return const Text('Hi');
    //   },
    // );

    localAuth
        .authenticate(
      localizedReason: 'Touch fingerprint scanner to login',
      options: const AuthenticationOptions(
          biometricOnly: true, stickyAuth: true, useErrorDialogs: true),
    )
        .then((isSuccess) {
      if (isSuccess) {
        Navigator.of(context).pop();
        if ((prefs?.getFingerId() ?? "").isNotEmpty) {
          // _bloc.add(
          //   AuthLoginFingerProceedEvent(),
          // );
          CommonDialogs.showToastMessage('Success');
        } else {
          Navigator.of(context).pop();

          CommonDialogs.showToastMessage(
              "You haven't registered your fingerprint to any account yet");
        }
      } else {
        // Navigator.of(context).pop();
        CommonDialogs.showToastMessage("Login cancelled");
      }
    }).catchError((e) {
      // Navigator.of(context).pop();
      if (e is PlatformException) {
        if (e.code == auth_error.notAvailable) {
          CommonDialogs.showToastMessage("Biometrics not available");
        } else if (e.code == auth_error.notEnrolled) {
          CommonDialogs.showToastMessage("Please set biometric first");
        } else {
          CommonDialogs.showToastMessage("Error ${e.message}");
        }
      } else {
        CommonDialogs.showToastMessage("Unknown Error $e");
      }
    });
  }
}
