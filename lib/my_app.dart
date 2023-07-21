import 'package:bloc_skeleton/common_ui/colors.dart';
import 'package:bloc_skeleton/src/forgot_password/presentation/email_send/email_send.dart';
import 'package:bloc_skeleton/src/main/presentation/main_page.dart';
import 'package:flutter/material.dart';

import 'src/auth/presentation/login/auth_login_page.dart';
import 'src/forgot_password/presentation/forgot_password_page.dart';
import 'src/splash/presentation/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HSE',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        // colorScheme: lightColorScheme,
        navigationBarTheme: const NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.route,
      routes: {
        AuthLoginPage.route: (ctx) => const AuthLoginPage(),
        MainPage.route: (ctx) => const MainPage(),
        SplashPage.route: (ctx) => const SplashPage(),
        ForgotPasswordPage.route: (ctx) => const ForgotPasswordPage(),
        EmailReadySend.route: (ctx) => const EmailReadySend(),
      },
    );
  }
}
