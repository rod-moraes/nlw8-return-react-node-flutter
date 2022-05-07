import 'package:flutter/material.dart';

abstract class AppColors {
  Color get brand;
  Color get textOnBrandColor;

  Color get surfacePrimary;
  Color get surfaceSecondary;
  Color get stroke;
  Color get tooltip;

  Color get textPrimary;
  Color get textSecondary;
  Color get textOnTooltip;

  Color get background;

  //COLORS SETTINGS
  Color get colorShimmer;
  Color get colorSecondaryShimmer;
  Color get border;
  Color get divider;
  Color get backgroundAlertDialogColor;
  Color get backgroundAlertDialog;
  Color get textSimple;
  Color get textButton;
  Color get textGradient;
  Color get textSnackBar;
  Color get appBarIconSettings;
  Color get appBarTitleSettings;
  Color get bodyIconBackgroundSettings;
  Color get bodyIconColorSettings;
  Color get bodyTitleSettings;
  Color get bodyCardSubtitleSettings;
  Color get bodyCardTitleSettings;
  Color get bodySwitchSettings;
  Color get bodyDesactiveSwitchSettings;
  Color get bodyBackgroundSettings;
  Color get bodyDividerSettings;
}

class AppColorsLight implements AppColors {
  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get brand => const Color(0xff8257e5);

  @override
  Color get textOnBrandColor => const Color(0xffffffff);

  @override
  Color get surfacePrimary => const Color(0xffffffff);
  @override
  Color get surfaceSecondary => const Color(0xfff4f4f5);

  @override
  Color get stroke => const Color(0xffd4d4d8);

  @override
  Color get tooltip => const Color(0xff27272a);

  @override
  Color get textPrimary => const Color(0xff27272a);

  @override
  Color get textSecondary => const Color(0xff71717a);

  @override
  Color get textOnTooltip => const Color(0xfff4f4f5);

  /*---------------COLORS SETTINGS---------------*/
  @override
  Color get colorShimmer => const Color(0x5f3f3f3f);

  @override
  Color get colorSecondaryShimmer => const Color(0xffaaa4a4);

  @override
  Color get border => const Color(0xFFDCE0E5);

  @override
  Color get divider => const Color(0x33666666);

  @override
  Color get backgroundAlertDialog => const Color(0xFFFFFFFF);

  @override
  Color get backgroundAlertDialogColor => const Color(0xFF4721B4);

  @override
  Color get textButton => const Color(0xFF666666);

  @override
  Color get textSimple => const Color(0xFF666666);

  @override
  Color get textGradient => const Color(0xFFFFFFFF);

  @override
  Color get textSnackBar => const Color(0xFFFFFFFF);

  @override
  Color get appBarIconSettings => const Color(0xFF4F4F4F);

  @override
  Color get appBarTitleSettings => const Color(0xFF4F4F4F);

  @override
  Color get bodyBackgroundSettings => const Color(0xFFF5F5FA);

  @override
  Color get bodyCardSubtitleSettings => const Color(0xFF828282);

  @override
  Color get bodyCardTitleSettings => const Color(0xFF4F4F4F);

  @override
  Color get bodyIconBackgroundSettings => const Color(0xFF585666);

  @override
  Color get bodyIconColorSettings => const Color(0xFFFFFFFF);

  @override
  Color get bodySwitchSettings => const Color(0xFF9B51E0);

  @override
  Color get bodyDesactiveSwitchSettings => const Color(0xFFFEFEFE);

  @override
  Color get bodyTitleSettings => const Color(0xFF333333);

  @override
  Color get bodyDividerSettings => const Color(0xFFE5E5E5);
}

class AppColorsDark implements AppColors {
  @override
  Color get background => const Color(0xFF09090A);

  @override
  Color get brand => const Color(0xff8257e5);

  @override
  Color get textOnBrandColor => const Color(0xffffffff);

  @override
  Color get surfacePrimary => const Color(0xff18181b);

  @override
  Color get surfaceSecondary => const Color(0xff27272A);

  @override
  Color get stroke => const Color(0xff52525b);

  @override
  Color get tooltip => const Color(0xfff4f4f5);

  @override
  Color get textPrimary => const Color(0xfff4f4f5);

  @override
  Color get textSecondary => const Color(0xffa1a1aa);

  @override
  Color get textOnTooltip => const Color(0xff27272a);
/*---------------COLORS SETTINGS---------------*/
  @override
  Color get colorShimmer => const Color(0x3ff3f3f3);

  @override
  Color get colorSecondaryShimmer => const Color(0x0f4a4a4a);

  @override
  Color get border => const Color(0xFF5C5C5C);

  @override
  Color get divider => const Color(0x33666666);

  @override
  Color get backgroundAlertDialog => const Color(0xFF333333);

  @override
  Color get backgroundAlertDialogColor => const Color(0xFF4721B4);

  @override
  Color get textGradient => const Color(0xFFFFFFFF);

  @override
  Color get textButton => const Color(0xFFFFFFFF);

  @override
  Color get textSimple => const Color(0xFFFFFFFF);

  @override
  Color get textSnackBar => const Color(0xFFFFFFFF);

  @override
  Color get appBarIconSettings => const Color(0xFFFFFFFF);

  @override
  Color get appBarTitleSettings => const Color(0xFFFFFFFF);

  @override
  Color get bodyBackgroundSettings => const Color(0xFF333333);

  @override
  Color get bodyCardSubtitleSettings => const Color(0xFFE0E0E0);

  @override
  Color get bodyCardTitleSettings => const Color(0xFFF2F2F2);

  @override
  Color get bodyIconBackgroundSettings => const Color(0xFF585666);

  @override
  Color get bodyIconColorSettings => const Color(0xFFFFFFFF);

  @override
  Color get bodySwitchSettings => const Color(0xFF9B51E0);

  @override
  Color get bodyDesactiveSwitchSettings => const Color(0xFFFEFEFE);

  @override
  Color get bodyTitleSettings => const Color(0xFFFFFFFF);

  @override
  Color get bodyDividerSettings => const Color(0xFF4F4F4F);
}
