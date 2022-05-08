import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../core.dart';

abstract class AppTextStyles {
  TextStyle get titleTextPrimary;
  TextStyle get titleTextSecondary;
  TextStyle get textPrimaryMedium;
  TextStyle get textPrimaryRegular;
  TextStyle get textSecondaryMedium;
  TextStyle get textSecondaryRegular;
  TextStyle get textSecondarySmall;
  TextStyle get buttonOnBrandColor;
  TextStyle get buttonTextPrimary;
  TextStyle get textTooltip;

  /*---------------TEXTSTYLE SETTINGS---------------*/
  TextStyle get textButton;
  TextStyle get textSnackBar;
  TextStyle get textAlertDialog;
  TextStyle get titleAlertDialog;
  TextStyle get appBarTitleSettings;
  TextStyle get bodyCardTitleSettings;
  TextStyle get bodyCardSubtitleSettings;
  TextStyle get bodyButtomTitleSettings;
  TextStyle get bodyTitleSettings;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get titleTextPrimary => GoogleFonts.inter(
        fontSize: 20,
        height: 24 / 20,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textPrimary,
      );

  @override
  TextStyle get titleTextSecondary => GoogleFonts.inter(
        fontSize: 16,
        height: 26 / 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.textSecondary,
      );

  @override
  TextStyle get textPrimaryMedium => GoogleFonts.inter(
        fontSize: 14,
        height: 24 / 14,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textPrimary,
      );

  @override
  TextStyle get textPrimaryRegular => GoogleFonts.inter(
        fontSize: 14,
        height: 24 / 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.textPrimary,
      );

  @override
  TextStyle get textSecondaryMedium => GoogleFonts.inter(
        fontSize: 14,
        height: 24 / 14,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textSecondary,
      );
  @override
  TextStyle get textSecondaryRegular => GoogleFonts.inter(
        fontSize: 14,
        height: 24 / 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.textSecondary,
      );

  @override
  TextStyle get textSecondarySmall => GoogleFonts.inter(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textSecondary,
      );
  @override
  TextStyle get buttonOnBrandColor => GoogleFonts.inter(
        fontSize: 14,
        height: 24 / 14,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textOnBrandColor,
      );
  @override
  TextStyle get buttonTextPrimary => GoogleFonts.inter(
        fontSize: 14,
        height: 24 / 14,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textPrimary,
      );
  @override
  TextStyle get textTooltip => GoogleFonts.inter(
        fontSize: 12,
        height: 12 / 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textOnTooltip,
      );
  /*---------------TEXTSTYLE SETTINGS---------------*/
  @override
  TextStyle get textButton => GoogleFonts.inter(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.textButton,
      );

  @override
  TextStyle get textAlertDialog => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.textSimple,
      );

  @override
  TextStyle get titleAlertDialog => GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.textGradient,
      );

  @override
  TextStyle get textSnackBar => GoogleFonts.inter(
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.textSnackBar,
      );

  @override
  TextStyle get appBarTitleSettings {
    return GoogleFonts.notoSans(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: AppTheme.colors.appBarTitleSettings,
    );
  }

  @override
  TextStyle get bodyButtomTitleSettings {
    return GoogleFonts.notoSans(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppTheme.colors.bodyCardTitleSettings,
    );
  }

  @override
  TextStyle get bodyCardSubtitleSettings {
    return GoogleFonts.notoSans(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      color: AppTheme.colors.bodyCardSubtitleSettings,
    );
  }

  @override
  TextStyle get bodyCardTitleSettings {
    return GoogleFonts.notoSans(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppTheme.colors.bodyCardTitleSettings,
    );
  }

  @override
  TextStyle get bodyTitleSettings {
    return GoogleFonts.notoSans(
      fontSize: 10.sp,
      fontWeight: FontWeight.w700,
      color: AppTheme.colors.bodyTitleSettings,
    );
  }
}
