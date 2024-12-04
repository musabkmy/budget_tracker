import 'package:budget_tracker/config/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

///must provide the [BuildContext] to change text [Color] depending on the brightness
class AppTextStyles {
  AppTextStyles(this.context);
  final AppColors appColors = AppColors();
  BuildContext context;

  ///For better size in large devices
  ///ScreenUtil().screenWidth > 600 ? base * 0.8 : base
  double adjustFont(double base) {
    return ScreenUtil().screenWidth > 600 ? base * 0.8 : base;
  }

  TextStyle get headline => GoogleFonts.roboto(
        // fontFamily: 'Georgia',
        fontWeight: FontWeight.bold,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        height: 1.2,
        fontSize: adjustFont(42.0.sp),
      );

  TextStyle get subHeadline => GoogleFonts.roboto(
        fontWeight: FontWeight.normal,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        height: 1.4,
        fontSize: adjustFont(18.0.sp),
      );

  TextStyle get title => GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        // height: 1.4,
        fontSize: adjustFont(16.0.sp),
      );

  TextStyle get subTitle => GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        height: 1.4,
        fontSize: adjustFont(16.0.sp),
      );

  TextStyle get bodyBold => GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        color: CupertinoDynamicColor.resolve(appColors.textBodyColor, context),
        fontSize: 14.0.sp,
      );

  TextStyle get bodyNormal => GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: CupertinoDynamicColor.resolve(appColors.textBody2Color, context),
        fontSize: 14.0.sp,
      );

  TextStyle get captionBold => GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        color: CupertinoDynamicColor.resolve(appColors.textBody2Color, context),
        fontSize: 12.0.sp,
      );

  TextStyle get captionNormal => GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: CupertinoDynamicColor.resolve(appColors.textBody2Color, context),
        fontSize: 12.0.sp,
      );

  TextStyle get action1 => GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
        color: CupertinoDynamicColor.resolve(
            appColors.primaryContrastingColor, context),
        fontSize: 18.0.sp,
      );

  TextStyle get action2 => GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
        color: CupertinoDynamicColor.resolve(
            appColors.textSecondaryActionColor, context),
        fontSize: 16.0.sp,
      );
}