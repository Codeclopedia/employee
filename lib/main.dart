import 'package:employee_app/core/routes.dart';
import 'package:employee_app/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import 'ui/home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, device) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: AppThemes.lightTheme,
        onGenerateRoute: AppRoutes.generateRoute,
        home: const HomePage(),
      );
    });
  }
}
