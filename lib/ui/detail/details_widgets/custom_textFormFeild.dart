import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/assets_widgets.dart';

Widget prefixTextFormField(
    {Function(String)? onchanged,
    Function()? ontap,
    Function(String?)? validate,
    required TextEditingController controller,
    required String prefixIconPath,
    required String hintText}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 3.w),
    child: TextFormField(
      onChanged: (value) => onchanged,
      readOnly: ontap != null ? true : false,
      onTap: ontap != null ? () => ontap() : () {},
      controller: controller,
      validator: (value) => validate!(value),
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: getSvgIcon(svgPath: prefixIconPath, height: 3.h),
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 10.w),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.teritaryColor,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.teritaryColor,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.teritaryColor,
              width: 2.0,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.teritaryColor,
              width: 2.0,
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          label: Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Text(hintText),
          )),
    ),
  );
}

Widget dropdownTextFormField(
    {required String svgPath,
    required String hintText,
    required TextEditingController controller,
    Function(String)? onchanged,
    Function(String?)? validate,
    Function()? ontap}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 3.w),
    child: TextFormField(
      onChanged: (value) => onchanged,
      showCursor: ontap == null ? true : false,
      readOnly: ontap != null ? true : false,
      controller: controller,
      validator: (value) {
        return validate!(value);
      },
      onTap: () => ontap != null ? ontap() : () {},
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: getSvgIcon(svgPath: svgPath, height: 3.h),
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 10.w),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.teritaryColor,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.teritaryColor,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.teritaryColor,
              width: 2.0,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.teritaryColor,
              width: 2.0,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: getSvgIcon(
                svgPath: 'arrow_drop_down_FILL1_wght400_GRAD0_opsz24 3.svg',
                height: 3.h),
          ),
          suffixIconConstraints: BoxConstraints(maxHeight: 10.w),
          contentPadding: const EdgeInsets.all(0),
          label: Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Text(hintText),
          )),
    ),
  );
}
