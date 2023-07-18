import 'package:bloc_skeleton/core/utils/date_time_util.dart';
import 'package:bloc_skeleton/di.dart';
import 'package:bloc_skeleton/my_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.STAGING;
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await initializeDateFormatting(DateTimeUtil.locale, null);

  runApp(const MyApp());
}
