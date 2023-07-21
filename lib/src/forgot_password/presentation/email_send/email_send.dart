import 'package:bloc_skeleton/common_ui/button/PrimaryButtonTextOnly.dart';
import 'package:bloc_skeleton/common_ui/colors.dart';
import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/common_ui/widgets/common_row_logo_text.dart';
import 'package:bloc_skeleton/core/utils/empty_padding.dart';
import 'package:bloc_skeleton/src/auth/presentation/copy_right.dart';
import 'package:bloc_skeleton/src/auth/presentation/login/auth_login_page.dart';
import 'package:flutter/material.dart';

class EmailReadySend extends StatelessWidget {
  static const route = '/auth/email_send/email_send';

  const EmailReadySend({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppColors.primaryText),
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (height / 4).ph,
            const RowLogoText(
              text: "Email Sent!",
            ),
            12.ph,
            Text(
              "We’ve sent you a Password reset link to your email.",
              style: CommonTypography.textH8.copyWith(
                  color: AppColors.madhaniGrey, fontWeight: FontWeight.w400),
            ),
            48.ph,
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
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AuthLoginPage.route, (Route<dynamic> route) => false);
                },
                icon: null,
              ),
            ),
            const Spacer(),
            const CopyRight(),
            20.ph
          ],
        ),
      ),
    );
  }
}
