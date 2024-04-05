import 'package:fake_api_exam/core/const/keyconst.dart';
import 'package:fake_api_exam/core/di/injection.dart';
import 'package:fake_api_exam/core/utils/environments.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  String flavor = const String.fromEnvironment(KeyConst.appFlavor);
  await Environment().initializeEnvironment(flavor);
  await initDi();

  runApp(const MyApp());
}
