import 'package:fake_api_exam/core/utils/environments.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  String flavor = const String.fromEnvironment('app_flavor');
  await Environment().initializeEnvironment(flavor);

  runApp(const MyApp());
}
