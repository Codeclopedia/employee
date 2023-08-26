import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../core/constants/app_colors.dart';

class CustomElevatedButtons {
  static Widget elevatedUnselectedButton(
          {required Function() onpressed, required String title}) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.5.w),
        child: ElevatedButton(
          onPressed: onpressed,
          style: ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll(AppColors.secondaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.w),
              ))),
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 6.sp),
          ),
        ),
      );

  static Widget elevationSelectedButton(
          {required Function() onpressed, required String title}) =>
      ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.w),
            ))),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 6.sp),
        ),
      );
}
