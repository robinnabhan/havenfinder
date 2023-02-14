import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constant {
/* *** *** Colors *** *** */
  static const Color brandColor = Color(0xFF87CEEB);
  static const Color linksColor = Color(0xFF396AFC);
  static const Color blackColor = Color(0xFF2C3030);
  static const Color greyColor = Color(0xFFA3A4A4);
  static const Color superLightGreyColor = Color(0xFFDBDBDB);
  static const Color lightGreyColor = Color(0xFFCDCDCD);
  static const Color hintColor = Color(0x662C3030);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFE63946);
  static const Color containerErrorColor = Color(0x26E63946);
  static const Color neutralColor = Color(0xFFFAFAFA);
  static const Color shadowColor = Color(0x1A000000);
  static const Color alertColor = Color(0xFFFFBF00);
  static const Color shimmerBaseColor = Color(0xFFF1EFEF);
  static const Color shimmerHighlightColor = Color(0xFFF9F8F8);

  static const Color primaryColor = Color(0xFF5473DF);
  static const Color primaryLight = Color(0xFF879BF7);
  static const Color primaryDark = Color(0xFF214BAC);
  static const Color accentColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF000000);

  static const Color brownColor = Color(0xFFE1D9D1);

  static const MaterialColor materialBrandColor = MaterialColor(0xFF5473DF, {
    50: Color(0xFF5473DF),
    100: Color(0xFF5473DF),
    200: Color(0xFF5473DF),
    300: Color(0xFF5473DF),
    400: Color(0xFF5473DF),
    500: Color(0xFF5473DF),
    600: Color(0xFF5473DF),
    700: Color(0xFF5473DF),
    800: Color(0xFF5473DF),
    900: Color(0xFF5473DF),
  });

  static const Color blueColor = Color(0xFF0033A0);

/* *** *** SystemUiOverlayStyle *** *** */
  static const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Constant.blackColor,
    systemNavigationBarDividerColor: Constant.blackColor,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Constant.lightGreyColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  );

/* *** *** Shadow *** *** */
  static BoxShadow shadow = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.05),
    spreadRadius: 0,
    blurRadius: 25,
    offset: const Offset(0, 5), // changes position of shadow
  );

/* *** *** Character Styles *** *** */
  static const header1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 19.0,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );
  static const header2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 19.0,
    color: blackColor,
    fontWeight: FontWeight.w400,
  );

  static const header3 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 17.0,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );

  static const button = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 17.0,
    color: whiteColor,
    fontWeight: FontWeight.w500,
  );

  static const bodyText1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    color: blackColor,
    fontWeight: FontWeight.w400,
  );

  static const bodyText2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );

  static const bodyText2Alt = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    color: brandColor,
    fontWeight: FontWeight.w500,
  );

  static const caption = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    color: blackColor,
    fontWeight: FontWeight.w400,
  );

  static const labelText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    color: hintColor,
    fontWeight: FontWeight.w400,
  );
  static const hintText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    color: hintColor,
    fontWeight: FontWeight.w400,
  );
  static const errorHintText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    color: errorColor,
    fontWeight: FontWeight.w400,
  );

  static const errorText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    color: errorColor,
    fontWeight: FontWeight.w400,
  );

  static const linkText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    color: brandColor,
    fontWeight: FontWeight.w600,
  );

  static const disabledLinkText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    color: greyColor,
    fontWeight: FontWeight.w600,
  );

  static const selectedLabelText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10.0,
    color: brandColor,
    fontWeight: FontWeight.w400,
  );

  static const unselectedLabelText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10.0,
    color: blackColor,
    fontWeight: FontWeight.w400,
  );

  static const outOfStockText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    color: errorColor,
    fontWeight: FontWeight.w500,
  );

  static const lowInStockText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    color: alertColor,
    fontWeight: FontWeight.w500,
  );

  static const inStockText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );

  static const stockText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    color: greyColor,
    fontWeight: FontWeight.w400,
  );
  static const textStyle24Medium = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24.0,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );
/* *** *** Button Height *** *** */
  static const double buttonHeight = 60;

/* *** *** Paddings *** *** */

  //tiny Padding

  static EdgeInsetsDirectional tinyStartPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(start: width * 0.0156);
  }

  static EdgeInsetsDirectional tinyEndPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(end: width * 0.0156);
  }

  static EdgeInsetsDirectional tinyTopPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(top: height * 0.0075);
  }

  static EdgeInsetsDirectional tinyBottomPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(bottom: height * 0.0075);
  }

  static EdgeInsets tinyHorizontalPadding({
    required double width,
  }) {
    return EdgeInsets.symmetric(horizontal: width * 0.0156);
  }

  static EdgeInsets tinyVerticalPadding({
    required double height,
  }) {
    return EdgeInsets.symmetric(vertical: height * 0.0075);
  }

  static EdgeInsets tinyAllPadding(
      {required double width, required double height}) {
    return EdgeInsets.symmetric(
      horizontal: width * 0.0156,
      vertical: height * 0.0075,
    );
  }

  //xSmall Padding
  static EdgeInsetsDirectional xSmallStartPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(start: width * 0.03125);
  }

  static EdgeInsetsDirectional xSmallEndPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(end: width * 0.03125);
  }

  static EdgeInsetsDirectional xSmallTopPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(top: height * 0.015);
  }

  static EdgeInsetsDirectional xSmallBottomPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(bottom: height * 0.015);
  }

  static EdgeInsets xSmallHorizontalPadding({
    required double width,
  }) {
    return EdgeInsets.symmetric(horizontal: width * 0.03125);
  }

  static EdgeInsetsDirectional xSmallHorizontalDirectionalPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(
      start: width * 0.03125,
      end: width * 0.03125,
    );
  }

  static EdgeInsets xSmallVerticalPadding({
    required double height,
  }) {
    return EdgeInsets.symmetric(vertical: height * 0.015);
  }

  static EdgeInsets xSmallAllPadding(
      {required double width, required double height}) {
    return EdgeInsets.symmetric(
      horizontal: width * 0.03125,
      vertical: height * 0.015,
    );
  }

  //small Padding

  static EdgeInsetsDirectional smallStartPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(start: width * 0.0469);
  }

  static EdgeInsetsDirectional smallEndPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(end: width * 0.0469);
  }

  static EdgeInsetsDirectional smallTopPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(top: height * 0.0225);
  }

  static EdgeInsetsDirectional smallBottomPadding({
    required double height,
  }) {
    // start: width * ratio
    return EdgeInsetsDirectional.only(bottom: height * 0.0225);
  }

  static EdgeInsets smallHorizontalPadding({
    required double width,
  }) {
    return EdgeInsets.symmetric(horizontal: width * 0.0469);
  }

  static EdgeInsetsDirectional smallHorizontalDirectionalPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(
        start: width * 0.0469, end: width * 0.0469);
  }

  static EdgeInsets smallVerticalPadding({
    required double height,
  }) {
    return EdgeInsets.symmetric(vertical: height * 0.0225);
  }

  static EdgeInsets smallAllPadding(
      {required double width, required double height}) {
    return EdgeInsets.symmetric(
      horizontal: width * 0.0469,
      vertical: height * 0.0225,
    );
  }

  //base Padding

  static EdgeInsetsDirectional baseStartPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(start: width * 0.06525);
  }

  static EdgeInsetsDirectional baseEndPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(end: width * 0.06525);
  }

  static EdgeInsetsDirectional baseTopPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(top: height * 0.03);
  }

  static EdgeInsetsDirectional baseBottomPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(bottom: height * 0.03);
  }

  static EdgeInsets baseHorizontalPadding({
    required double width,
  }) {
    return EdgeInsets.symmetric(horizontal: width * 0.06525);
  }

  static EdgeInsets baseVerticalPadding({
    required double height,
  }) {
    return EdgeInsets.symmetric(vertical: height * 0.03);
  }

  static EdgeInsets baseAllPadding(
      {required double width, required double height}) {
    return EdgeInsets.symmetric(
      horizontal: width * 0.06525,
      vertical: height * 0.03,
    );
  }

  //large Padding

  static EdgeInsetsDirectional largeStartPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(start: width * 0.09375);
  }

  static EdgeInsetsDirectional largeEndPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(end: width * 0.09375);
  }

  static EdgeInsetsDirectional largeTopPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(top: height * 0.045);
  }

  static EdgeInsetsDirectional largeBottomPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(bottom: height * 0.045);
  }

  static EdgeInsets largeHorizontalPadding({
    required double width,
  }) {
    return EdgeInsets.symmetric(horizontal: width * 0.09375);
  }

  static EdgeInsets largeVerticalPadding({
    required double height,
  }) {
    return EdgeInsets.symmetric(vertical: height * 0.045);
  }

  static EdgeInsets largeAllPadding(
      {required double width, required double height}) {
    return EdgeInsets.symmetric(
      horizontal: width * 0.09375,
      vertical: height * 0.045,
    );
  }

  //xLarge Padding

  static EdgeInsetsDirectional xLargeStartPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(start: width * 0.125);
  }

  static EdgeInsetsDirectional xLargeEndPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(end: width * 0.125);
  }

  static EdgeInsetsDirectional xLargeTopPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(top: height * 0.06);
  }

  static EdgeInsetsDirectional xLargeBottomPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(bottom: height * 0.06);
  }

  static EdgeInsets xLargeHorizontalPadding({
    required double width,
  }) {
    return EdgeInsets.symmetric(horizontal: width * 0.125);
  }

  static EdgeInsets xLargeVerticalPadding({
    required double height,
  }) {
    return EdgeInsets.symmetric(vertical: height * 0.06);
  }

  static EdgeInsets xLargeAllPadding(
      {required double width, required double height}) {
    return EdgeInsets.symmetric(
      horizontal: width * 0.125,
      vertical: height * 0.06,
    );
  }

  //huge Padding

  static EdgeInsetsDirectional hugeStartPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(start: width * 0.15625);
  }

  static EdgeInsetsDirectional hugeEndPadding({
    required double width,
  }) {
    return EdgeInsetsDirectional.only(end: width * 0.15625);
  }

  static EdgeInsetsDirectional hugeTopPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(top: height * 0.075);
  }

  static EdgeInsetsDirectional hugeBottomPadding({
    required double height,
  }) {
    return EdgeInsetsDirectional.only(bottom: height * 0.075);
  }

  static EdgeInsets hugeHorizontalPadding({
    required double width,
  }) {
    return EdgeInsets.symmetric(horizontal: width * 0.15625);
  }

  static EdgeInsets hugeVerticalPadding({
    required double height,
  }) {
    return EdgeInsets.symmetric(vertical: height * 0.075);
  }

  static EdgeInsets hugeAllPadding(
      {required double width, required double height}) {
    return EdgeInsets.symmetric(
      horizontal: width * 0.15625,
      vertical: height * 0.075,
    );
  }
  //Special Case Padding

  static EdgeInsets tabBarIconPadding({
    required double height,
  }) {
    return EdgeInsets.only(
      top: height * 0.0075,
      bottom: height * 0.0075,
    );
  }

  static EdgeInsetsDirectional errorContainerPadding({
    required double width,
    required double height,
  }) {
    return EdgeInsetsDirectional.only(
      start: width * 0.0469,
      end: width * 0.0469,
      top: height * 0.015,
    );
  }

  static EdgeInsets outerDialogPadding({
    required double width,
    required double height,
    required double safeAreaBottomHeigth,
    required double? customHeightRatio,
  }) {
    return EdgeInsets.only(
      left: width * 0.0156,
      right: width * 0.0156,
      bottom: safeAreaBottomHeigth > 0
          ? safeAreaBottomHeigth * 0.55
          : height * 0.0075,
      top: customHeightRatio != null
          ? height * (1 - customHeightRatio)
          : height * 0.055,
    );
  }

  static EdgeInsetsDirectional innerDialogPadding(
      {required double width, required double height}) {
    return EdgeInsetsDirectional.only(
      start: width * 0.0469,
      end: width * 0.0469,
      bottom: height * 0.0225,
    );
  }

  static EdgeInsetsDirectional searchPadding(
      {required double width, required double height}) {
    return EdgeInsetsDirectional.only(
      top: height * 0.03,
      bottom: height * 0.045,
      start: width * 0.06525,
      end: width * 0.06525,
    );
  }

  static EdgeInsetsDirectional imageHandlerListAlt(
      {required double width, required double height}) {
    return EdgeInsetsDirectional.only(
      start: width * 0.0156,
      end: width * 0.0156,
      top: height * 0.0075,
      bottom: height * 0.0075,
    );
  }

  static EdgeInsetsDirectional imageHandlerList(
      {required double width, required double height}) {
    return EdgeInsetsDirectional.only(
      start: width * 0.0156,
      end: width * 0.1652,
      top: height * 0.0075,
      bottom: height * 0.0075,
    );
  }

  static EdgeInsetsDirectional imageHandlerOptionsList(
      {required double width, required double height}) {
    return EdgeInsetsDirectional.only(
      start: width * 0.0156,
      end: width * 0.0312,
      top: height * 0.0075,
      bottom: height * 0.0075,
    );
  }

  static EdgeInsetsDirectional imageHandlerListButton(
      {required double width, required double height}) {
    return EdgeInsetsDirectional.only(
      start: width * 0.0156,
      top: height * 0.0075,
      bottom: height * 0.0075,
    );
  }

  static EdgeInsets variantPilePadding(
      {required double width, required double height}) {
    return EdgeInsets.symmetric(
      horizontal: width * 0.047,
      vertical: height * 0.012,
    );
  }

  static EdgeInsetsDirectional itemsGridViewPadding(
      {required double width, required double height}) {
    return EdgeInsetsDirectional.only(
      start: width * 0.0469,
      end: width * 0.0469,
      top: height * 0.045,
      bottom: height * 0.07,
    );
  }

  static EdgeInsetsDirectional locationsListPadding(
      {required double width, required double height}) {
    return EdgeInsetsDirectional.only(
      start: width * 0.0469,
      end: width * 0.0469,
      top: height * 0.0225,
      bottom: height * 0.1,
    );
  }

  static EdgeInsets dashboardListPadding({
    required double height,
  }) {
    return EdgeInsets.only(
      top: height * 0.03,
      bottom: height * 0.07,
    );
  }

  static EdgeInsetsDirectional dashLinePadding({
    required double width,
    required double height,
  }) {
    return EdgeInsetsDirectional.only(
      top: height * 0.0075,
      start: width * 0.06525,
      bottom: height * 0.0075,
    );
  }

/* *** *** Extentions *** *** */
  static double diameter({
    required double width,
    required double height,
    required double widthRatio,
    required double heightRatio,
  }) {
    return radius(
          width: width,
          height: height,
          widthRatio: widthRatio,
          heightRatio: heightRatio,
        ) *
        2;
  }

  static double radius({
    required double width,
    required double height,
    required double widthRatio,
    required double heightRatio,
  }) {
// Let the radius of the circle be r
// Let the height and width of the arc be h & d
// Now, the diameter DC bisects the chord AB in two halves, each having length d/2
// Also the diameter is divided by the chord in two parts, the part inside arc h and the remaining 2r-h
// Now from intersecting chords theorem,
// h*(2r-h) = (d/2)^2
// or, 2rh – h^2 = d^2/4
// so, r = d^2/8h + h/2
    return (((width * widthRatio) * (width * widthRatio)) /
            (8 * ((height * heightRatio) / 2)) +
        ((height * heightRatio) / 2) / 2);
  }
}
