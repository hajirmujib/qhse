import 'dart:developer';

import 'package:bloc_skeleton/common_ui/colors.dart';
import 'package:bloc_skeleton/common_ui/common_icons.dart';
import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/core/data/local/app_preferences.dart';
import 'package:bloc_skeleton/core/utils/empty_padding.dart';
import 'package:bloc_skeleton/src/auth/presentation/login/auth_login_page.dart';
import 'package:bloc_skeleton/src/main/presentation/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashPage extends StatefulWidget {
  static const route = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AppPreferences? prefs;
  var splashDuration = const Duration(seconds: 4);

  // Future<String> getDeviceId() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   String? deviceId;
  //   try {
  //     if (Theme.of(context).platform == TargetPlatform.android) {
  //       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //       deviceId = androidInfo.id; // Device ID for Android
  //     } else if (Theme.of(context).platform == TargetPlatform.iOS) {
  //       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //       deviceId = iosInfo.identifierForVendor; // Device ID for iOS
  //     }
  //   } catch (e) {
  //     print('Error getting device ID: $e');
  //   }

  //   return deviceId ?? "";
  // }

  @override
  void initState() {
    super.initState();
    getInfo();

    Future.delayed(splashDuration).then((value) {
      // var deviceId = prefs?.getDeviceId() ?? "";
      // if (deviceId.isEmpty) {
      //   var randomUUid = const Uuid().v4();
      //   prefs?.setDeviceId("$randomUUid");
      // }
      // initialAutoSyncBackground();
      if ((prefs?.getToken() ?? '').isEmpty) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            AuthLoginPage.route, (Route<dynamic> route) => false);
      } else {
        log("Token : ${prefs?.getToken()}");
        Navigator.of(context).pushNamedAndRemoveUntil(
            MainPage.route, (Route<dynamic> route) => false);
      }
    });
  }

  void getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    prefs?.setVersion(packageInfo.version);
    log("version ${packageInfo.version}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    prefs = GetIt.instance<AppPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  CommonIcons.getAssetPath('Madhani QHSE App Logo.svg'),
                  width: 160,
                  height: 160,
                ),
                6.ph,
                Text(
                  'QHSE Auto',
                  style: CommonTypography.textH5
                      .copyWith(color: AppColors.madhaniBlue),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
