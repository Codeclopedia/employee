import 'package:employee_app/core/data/models/employee_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../../core/constants/routes_names.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/assets_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employee List',
          style: AppTextStyles.titleStyle,
        ),
      ),
      body: Center(
        child: getSvgIcon(svgPath: 'Frame 19726.svg', height: 30.h),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final EmployeeDetails employeeDetails = EmployeeDetails();
          const bool addDetailsPage = true;
          final Map<String, dynamic> arguments = {
            'employeeDetails': employeeDetails,
            'addDetailPage': addDetailsPage
          };
          Navigator.pushNamed(context, RoutesNames.addDetail,
              arguments: arguments);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
