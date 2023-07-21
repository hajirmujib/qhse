import 'dart:developer';

import 'package:bloc_skeleton/core/data/local/app_preferences.dart';
import 'package:bloc_skeleton/core/utils/empty_padding.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CopyRight extends StatefulWidget {
  const CopyRight({super.key});

  @override
  State<CopyRight> createState() => _CopyRightState();
}

class _CopyRightState extends State<CopyRight> {
  AppPreferences? prefs;

  late String? _version;
  @override
  void initState() {
    prefs = GetIt.instance<AppPreferences>();
    _version = prefs?.getVersion() ?? "";

    log("version pref : ${prefs?.getVersion()}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Copyright © 2023 ",
                style: TextStyle(
                  fontSize: 10,
                  // fontFamily:FontFamily(Font(R.font.inter)),
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7F8895),
                )),
            Text("Madhani Talatah Nusantara",
                style: TextStyle(
                  fontSize: 10,

                  // fontFamily:FontFamily(Font(R.font.inter)),
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7F8895),
                )),
          ],
        ),
        const Text("All Rights Reserved",
            style: TextStyle(
              fontSize: 10,
              // fontFamily:FontFamily(Font(R.font.inter)),
              fontWeight: FontWeight.w400,
              color: Color(0xFF7F8895),
            )),
        6.ph,
        Text("App version $_version",
            style: const TextStyle(
              fontSize: 10,
              // fontFamily:FontFamily(Font(R.font.inter)),
              fontWeight: FontWeight.w400,
              color: Color(0xFF7F8895),
            )),
      ],
    );
  }
}
