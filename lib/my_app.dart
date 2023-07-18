import 'package:flutter/material.dart';

import 'src/auth/presentation/login/auth_login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HSE',
      theme: ThemeData(
        // colorScheme: lightColorScheme,
        navigationBarTheme: const NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AuthLoginPage.route,
      routes: {
        AuthLoginPage.route: (ctx) => const AuthLoginPage(),
      },
    );
  }
}
