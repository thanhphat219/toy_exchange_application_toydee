import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class S {
  static final colors = _Colors();
  static final textStyles = _TextStyles();
  static final dimens = _Dimens();
  static final inputBorders = _InputBorders();

  static final TextStyle h2 = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(36),
    fontWeight: FontWeight.w500,
    color: S.colors.textColor_1,
  );
}

class _Colors {
  final primary = const Color(0xFFF8956F);

  //Accent
  final accent_1 = const Color(0xFFFF6263); // Bitter sweet
  final accent_2 = const Color(0xFFFF936B); // Atomic Tangerine
  final accent_3 = const Color(0xFFFFB3B3); // Meion
  final accent_4 = const Color(0xFFFFDD66); // Dandelion
  final accent_5 = const Color(0xFFF9DBD0);
  final accent_6 = const Color(0xFF6455AB);
  final accent_7 = const Color(0xFFB3C0FF);
  final accent_8 = const Color(0xFFE0E4FF);

  //Logo
  final logo1 = const Color(0xFFFF6263); // red
  final logo2 = const Color(0xFF6455AB); // blue purple

  //Background
  final background_1 = const Color(0xFFF4F5F9); // background
  final background_2 = const Color(0xFFFFFFFF); // background text field

  //Grays
  final gray_1 = const Color(0xFF5D6178); // Dark Electric Blue
  final gray_2 = const Color(0xFF898C9F); // Cool Grey
  final gray_3 = const Color(0xFFBBBCC9); // Lavender Gray
  final gray_4 = const Color(0xFFDFE0E7); // Platinum
  final gray_5 = const Color(0xFFF5F6F8); // Cultured

  //Text color
  final textColor_1 = const Color(0xFF261F41);

  final lavender = const Color(0xFFE0E4FF);
}

class _TextStyles {
  final h2 = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(36),
    fontWeight: FontWeight.bold,
    color: S.colors.textColor_1,
  );
  final h2Primary = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(36),
    fontWeight: FontWeight.bold,
    color: S.colors.primary,
  );
  final h3 = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(28),
    fontWeight: FontWeight.bold,
    color: S.colors.textColor_1,
  );
  final TextStyle h4 = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(20),
    fontWeight: FontWeight.bold,
    color: S.colors.textColor_1,
  );
  final TextStyle h5 = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(36),
    fontWeight: FontWeight.w900,
    color: S.colors.primary,
  );
  final titleHeavy = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(18),
    fontWeight: FontWeight.w600,
    color: S.colors.textColor_1,
    letterSpacing: 1.2,
  );
  final titleLight = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w600,
    color: S.colors.textColor_1,
    letterSpacing: 0.05,
    textBaseline: TextBaseline.alphabetic,
  );

  final nav = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.bold,
    color: S.colors.gray_3,
  );

  final navSelected = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.bold,
    color: S.colors.primary,
  );

  final titleLightPrimary = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w600,
    color: S.colors.primary,
    letterSpacing: 1.2,
  );

  final titleHeavyPrimary = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(18),
    fontWeight: FontWeight.w600,
    color: S.colors.primary,
    letterSpacing: 0.5,
  );

  final TextStyle h4Underline = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(20),
    fontWeight: FontWeight.bold,
    color: S.colors.textColor_1,
    decoration: TextDecoration.underline,
  );

  final titleLightUnderline = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w600,
    color: S.colors.textColor_1,
    letterSpacing: 1.2,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.underline,
  );

  final titleLightNoSpacing = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w500,
    color: S.colors.textColor_1,
    textBaseline: TextBaseline.alphabetic,
  );

  final titleHeavyBoldPrimary = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(18),
    fontWeight: FontWeight.bold,
    color: S.colors.primary,
    letterSpacing: 0.5,
  );

  final titleHeavyNoSpacing = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(18),
    fontWeight: FontWeight.w600,
    color: S.colors.textColor_1,
  );

  final h6 = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.bold,
  );

  final description = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.normal,
    color: S.colors.textColor_1,
  );

  final titleLightBoldNoSpacing = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(15),
    fontWeight: FontWeight.bold,
    color: S.colors.textColor_1,
    textBaseline: TextBaseline.alphabetic,
  );

  final titleLightBoldNoSpacingPrimary = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(15),
    fontWeight: FontWeight.bold,
    color: S.colors.primary,
    textBaseline: TextBaseline.alphabetic,
  );

  final toastStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.bold,
    color: S.colors.textColor_1,
  );
}

class _Dimens {
  final defaultPadding_4 = 253 / 60 * ScreenUtil().scaleWidth;
  final defaultPadding_8 = 759 / 80 * ScreenUtil().scaleWidth;
  final defaultPadding_16 = 253 / 15 * ScreenUtil().scaleWidth;
  final defaultPadding_24 = 253 / 10 * ScreenUtil().scaleWidth;
  final defaultPadding_32 = 506 / 15 * ScreenUtil().scaleWidth;
  final defaultPadding_40 = 253 / 6 * ScreenUtil().scaleWidth;
  final defaultPadding_48 = 253 / 5 * ScreenUtil().scaleWidth;
  final defaultPadding_64 = 1012 / 15 * ScreenUtil().scaleWidth;
  final defaultPadding_80 = 253 / 3 * ScreenUtil().scaleWidth;
  final defaultPadding_100 = 506 / 5 * ScreenUtil().scaleWidth;
  final defaultPadding_128 = 2024 / 15 * ScreenUtil().scaleWidth;
  final defaultPadding_256 = 4048 / 15 * ScreenUtil().scaleWidth;
  final defaultPadding_88 = 2783 / 30 * ScreenUtil().scaleWidth;

  final defaultBorderRadius = 759 / 80 * ScreenUtil().scaleWidth;

  final defaultPaddingVertical_4 = 253 / 60 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_8 = 759 / 80 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_12 = 253 / 20 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_16 = 253 / 15 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_24 = 253 / 10 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_32 = 506 / 15 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_40 = 253 / 6 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_48 = 253 / 5 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_64 = 1012 / 15 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_80 = 253 / 3 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_100 = 506 / 5 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_128 = 2024 / 15 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_256 = 4048 / 15 * ScreenUtil().scaleHeight;
  final defaultPaddingVertical_88 = 2783 / 30 * ScreenUtil().scaleHeight;
}

class _InputBorders {
  final inputBorderStyle = OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(S.dimens.defaultBorderRadius)),
    borderSide: BorderSide.none,
  );

  final inputFocusedBorderStyle = OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(S.dimens.defaultBorderRadius)),
    borderSide: BorderSide(color: S.colors.primary, width: 2),
  );

  final inputFocusedErrorBorderStyle = OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(S.dimens.defaultBorderRadius)),
    borderSide: BorderSide(color: Colors.red[400]!, width: 2),
  );

  final inputErrorBorderStyle = OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(S.dimens.defaultBorderRadius)),
    borderSide: BorderSide.none,
  );
}
