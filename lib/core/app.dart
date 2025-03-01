import 'package:fake_api_exam/core/resource/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'const/routes_const.dart';
import 'const/string_conts.dart';
import 'navigation/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (BuildContext context) {
        return MaterialApp(
          title: StringConst.kAppName,
          theme: ThemeData(
            fontFamily: StringConst.kDefaultFontFamily,
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: AppColors.appBarColor,
            ),
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColorScheme,
            ),
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          ),
          initialRoute: RoutesConst.root,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
