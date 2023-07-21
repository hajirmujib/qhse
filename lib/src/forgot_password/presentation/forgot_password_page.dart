import 'package:bloc_skeleton/common_ui/button/PrimaryButtonTextOnly.dart';
import 'package:bloc_skeleton/common_ui/colors.dart';
import 'package:bloc_skeleton/common_ui/common_colors.dart';
import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/common_ui/dialogs/common_dialogs.dart';
import 'package:bloc_skeleton/common_ui/widgets/common_row_logo_text.dart';
import 'package:bloc_skeleton/common_ui/widgets/common_textfield.dart';
import 'package:bloc_skeleton/core/utils/empty_padding.dart';
import 'package:bloc_skeleton/src/auth/presentation/copy_right.dart';
import 'package:bloc_skeleton/src/forgot_password/presentation/email_send/email_send.dart';
import 'package:bloc_skeleton/src/forgot_password/presentation/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const route = '/ForgotPassword';

  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordBloc(
        forgotPasswordUseCase: GetIt.instance(),
      )..add(ForgotPasswordInitEvent()),
      child: _ForgotPasswordPageView(),
    );
  }
}

class _ForgotPasswordPageView extends StatelessWidget {
  _ForgotPasswordPageView({Key? key}) : super(key: key);
  final inputFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext contextt) {
    final height = MediaQuery.of(contextt).size.height;
    bool limitRest = false;

    final bloc = BlocProvider.of<ForgotPasswordBloc>(contextt);
    final TextEditingController emailController = TextEditingController();

    void showLoadingDialog() {
      CommonDialogs.showLoadingDialog(contextt);
    }

    doReset() {
      FocusScope.of(contextt).unfocus();
      if (inputFormKey.currentState?.validate() == true) {
        bloc.add(ForgotPasswordProcessedEvent(email: emailController.text));
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(contextt).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: const IconThemeData(color: AppColors.primaryText),
          backgroundColor: AppColors.white,
        ),
        body: Center(
          child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is ForgotPasswordLoadingState) {
                showLoadingDialog();
              } else if (state is ForgotPasswordErrorState) {
                CommonDialogs.showToastMessage(state.data.error?.message);
              } else if (state is ForgotPasswordSuccessState) {
                Navigator.pop(contextt);
                Navigator.of(context).pushNamed(EmailReadySend.route);
              }
            },
            builder: (context, state) {
              if (state is ForgotPasswordLoadingState) {
                return const CircularProgressIndicator();
              }

              return Container(
                height: height,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    40.ph,
                    const Center(
                      child: RowLogoText(
                        text: "Forgot Password",
                      ),
                    ),
                    12.ph,
                    Center(
                      child: Text(
                        "If you're unsure of your registered email, you can ask it from your HR department.",
                        style: CommonTypography.textH8.copyWith(
                            color: AppColors.madhaniGrey,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    48.ph,
                    Form(
                      key: inputFormKey,
                      child: CommonTextField(
                        formHeight: 44,
                        label: 'Email',
                        labelTextStyle: CommonTypography.textH8.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryText),
                        controller: emailController,
                        hint: 'Enter your Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        borderColor:
                            limitRest == true ? CommonColors.red26 : null,
                        hintColor:
                            limitRest == true ? CommonColors.red26 : null,
                        inputFormatters: const [
                          // FilteringTextInputFormatter.allow(
                          //     RegExp('[a-zA-Z0-9-@]')),
                          // UpperCaseTextFormatter()
                        ],
                        validators: const [
                          CommonTextFieldValidator.noEmpty,
                          CommonTextFieldValidator.email,
                        ],
                        radius: 8,
                      ),
                    ),
                    Visibility(visible: limitRest, child: 12.ph),
                    Visibility(
                      visible: limitRest,
                      child: Text(
                        "You have reach your limit, please contact your HR departement!",
                        style: CommonTypography.textH9.copyWith(
                            color: CommonColors.red26,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    40.ph,
                    SizedBox(
                      height: 40,
                      child: PrimaryButtonTextOnly(
                        // customHeight: 40,
                        // customWidth: double.infinity,
                        borderRadius: 8,
                        fontSize: 14,
                        backgroundColor: AppColors.madhaniBlue,
                        isActive: true,
                        label: 'Reset My Password',
                        onTap: doReset,
                        icon: null,
                      ),
                    ),
                    const Spacer(),
                    const CopyRight(),
                    20.ph
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
