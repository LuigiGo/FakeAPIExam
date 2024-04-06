import 'package:fake_api_exam/core/const/key_const.dart';
import 'package:fake_api_exam/core/di/injection.dart';
import 'package:fake_api_exam/core/environments.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  String flavor = const String.fromEnvironment(KeyConst.appFlavor);
  await Environment().initializeEnvironment(flavor);
  await initDi();

  runApp(const MyApp());
}
