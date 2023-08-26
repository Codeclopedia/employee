import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer_pro/sizer.dart';

SvgPicture getSvgIcon(
    {required String svgPath, double? height, double? width}) {
  return SvgPicture.asset(
    'assets/icons/svg/$svgPath',
    height: height ?? 3.h,
    width: width ?? 5.w,
    fit: BoxFit.contain,
  );
}
