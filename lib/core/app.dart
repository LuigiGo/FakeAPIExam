import 'package:fake_api_exam/core/resource/app_typography.dart';
import 'package:fake_api_exam/core/resource/color_palette.dart';
import 'package:flutter/material.dart';

import 'const/routes_const.dart';
import 'navigation/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.appBarColor,
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColorScheme,
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        textTheme: const TextTheme(
          bodyLarge: AppTypography.textBodyLarge,
          bodyMedium: AppTypography.textBodyMedium,
        ),
      ),
      initialRoute: RoutesConst.root,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
