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

  TextStyle get headline => GoogleFonts.poppins(
        // fontFamily: 'Georgia',
        fontWeight: FontWeight.bold,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        height: 1.2,
        fontSize: adjustFont(38.0.sp),
      );

  TextStyle get subHeadline => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        height: 1.4,
        fontSize: adjustFont(16.0.sp),
      );

  TextStyle get headline2 => GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        height: 1.2,
        fontSize: adjustFont(28.0.sp),
      );

  TextStyle get title => GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        // height: 1.4,
        fontSize: adjustFont(16.0.sp),
      );

  TextStyle get subTitle => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        height: 1.4,
        fontSize: adjustFont(16.0.sp),
      );

  TextStyle get bodyBold => GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: CupertinoDynamicColor.resolve(appColors.textBodyColor, context),
        fontSize: 14.0.sp,
      );

  TextStyle get bodyNormal => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: CupertinoDynamicColor.resolve(appColors.textBody2Color, context),
        fontSize: 14.0.sp,
      );

  TextStyle get captionBold => GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: CupertinoDynamicColor.resolve(appColors.textBody2Color, context),
        fontSize: 12.0.sp,
      );

  TextStyle get captionNormal => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        letterSpacing: 0.8,
        color: CupertinoDynamicColor.resolve(appColors.textBody2Color, context),
        fontSize: 12.0.sp,
      );

  TextStyle get action1 => GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
        color: CupertinoDynamicColor.resolve(
            appColors.primaryContrastingColor, context),
        fontSize: 14.0.sp,
      );

  TextStyle get action2 => GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
        color: CupertinoDynamicColor.resolve(
            appColors.textSecondaryActionColor, context),
        fontSize: 14.0.sp,
      );

  TextStyle get fieldTitleGrey => GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: CupertinoDynamicColor.resolve(appColors.textBody2Color, context),
        fontSize: 12.0.sp,
      );

  TextStyle get fieldTitleBrighter => GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: CupertinoDynamicColor.resolve(appColors.primaryColor, context),
        fontSize: 12.0.sp,
      );

  TextStyle get fieldText => GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        height: 1.4,
        fontSize: adjustFont(14.0.sp),
      );

  TextStyle get tabText => GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
        color: CupertinoDynamicColor.resolve(appColors.textTitleColor, context),
        height: 1.4,
        fontSize: adjustFont(16.0.sp),
      );
}
