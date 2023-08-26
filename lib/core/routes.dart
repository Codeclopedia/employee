import 'package:flutter/material.dart';

import '../ui/detail/add_employee.dart';
import '../ui/home/homepage.dart';
import 'constants/routes_names.dart';

class AppRoutes {
  AppRoutes._();
  static Route generateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case RoutesNames.homepage:
        screen = const HomePage();
      case RoutesNames.addDetail:
        final arguments = settings.arguments;
        if (arguments is Map) {
          screen = AddOrEditEmployeeScreen(
              employeeDetails: arguments['employeeDetails'],
              addDetailPage: arguments['addDetailPage']);
        } else {
          screen = _parameterMissing();
        }

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No routes defined for ${settings.name} yet.'),
            ),
          ),
        );
    }
    return MaterialPageRoute(
      builder: (context) => screen,
    );
  }

  static Widget _parameterMissing() {
    return const Scaffold(
      body: Center(
        child: Text('Not a valid parameter passed'),
      ),
    );
  }
}
