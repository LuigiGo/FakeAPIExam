import 'package:fake_api_exam/features/details/presentation/persons_details_page.dart';
import 'package:fake_api_exam/features/homepage/data/models/person.dart';
import 'package:flutter/material.dart';

import '../../features/homepage/presentation/screens/homepage.dart';
import '../const/routes_const.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;
    late Widget page;

    switch (settings.name) {
      case RoutesConst.root:
        page = const Homepage(
          title: 'Homepage',
        );
        break;
      case RoutesConst.detailsPage:
        page = PersonsDetailsPage(
          person: args as Person,
        );
        break;
    }

    return _generateMaterialPageRoute(page, settings);
  }

  static MaterialPageRoute<dynamic> _generateMaterialPageRoute(
    Widget widget,
    RouteSettings settings,
  ) {
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}
