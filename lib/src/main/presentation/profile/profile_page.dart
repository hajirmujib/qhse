import 'package:bloc_skeleton/core/data/local/app_preferences.dart';
import 'package:bloc_skeleton/core/utils/empty_padding.dart';
import 'package:bloc_skeleton/src/auth/presentation/login/auth_login_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  static const route = '/main/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    prefs = GetIt.instance<AppPreferences>();

    super.initState();
  }

  AppPreferences? prefs;

  logout() {
    prefs?.setToken(null);

    if ((prefs?.getToken() ?? '').isEmpty) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          AuthLoginPage.route, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Profile'),
          ),
          6.ph,
          InkWell(
            onTap: () {
              setState(() {
                logout();
              });
            },
            child: const Text('Sign Out'),
          )
        ],
      ),
    );
  }
}
