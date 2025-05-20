import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';

class TextStyleHelper {
// Login - Register Pages
  static TextStyle loginTitleStyle = GoogleFonts.montserrat(
      fontSize: 46,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.mainTitleYellow,
      height: 1.2);

  static TextStyle loginTitle2Style = GoogleFonts.montserrat(
      fontSize: 46,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.mainTitleBlue,
      height: 1.2,
      shadows: [Shadow(color: ColorUiHelper.mainTitleShadow, blurRadius: 5)]);

  static TextStyle loginSubtitle2Style = GoogleFonts.montserrat(
      fontSize: 16,
      color: ColorUiHelper.mainSubtitleColor,
      fontWeight: FontWeight.w200);

  static TextStyle forgotPasswordTextStyle = GoogleFonts.montserrat(
      fontSize: 12, color: ColorUiHelper.inputSecondDarkColor);

  static TextStyle loginButtonTextStyle = GoogleFonts.montserrat(
      fontSize: 14, color: ColorUiHelper.mainSubtitleColor);

  static TextStyle registerTextStyle = GoogleFonts.montserrat(
      fontSize: 14,
      color: ColorUiHelper.inputSecondDarkColor,
      fontWeight: FontWeight.w600);

// Category Page
  static TextStyle categoryTitleStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.mainTitleYellow,
      height: 1.2);

  static TextStyle categorySubitleStyle = GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: ColorUiHelper.mainSubtitleColor,
      height: 1,
      letterSpacing: 2);

  static TextStyle categoryContentStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: ColorUiHelper.mainSubtitleColor,
      height: 1,
      letterSpacing: 1.2);

  static TextStyle categoryContentSecondarStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: ColorUiHelper.categoryTicketColor,
      height: 1);

// Profile page
  static TextStyle profileDetailStyle = GoogleFonts.montserrat(
      fontSize: 14, color: ColorUiHelper.profileGradiendPrimary, height: 1);

  static TextStyle profileDetailUnderlineStyle = GoogleFonts.montserrat(
    fontSize: 14,
    color: ColorUiHelper.profileGradiendPrimary,
    height: 1,
    decoration: TextDecoration.underline,
  );

  static TextStyle profileDetailCounterStyle = GoogleFonts.montserrat(
    fontSize: 24,
    color: ColorUiHelper.profileGradiendPrimary,
    fontWeight: FontWeight.w600,
  );

// Past jobs page

  static TextStyle pastJobsTitleStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorUiHelper.mainSubtitleColor,
      height: 1.2);

// input text style
  static TextStyle inputTextStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: ColorUiHelper.inputHintColor,
      height: 1.2);

// Sort bar
  static TextStyle sortSelectedTextStyle = GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ColorUiHelper.mainSubtitleColor,
      height: 1);
  static TextStyle sortTextStyle = GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: ColorUiHelper.categoryTicketColor,
      height: 1);

// Product box
  static TextStyle productTitleTextStyle = GoogleFonts.montserrat(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: ColorUiHelper.productTitleColor,
      height: 1);
  static TextStyle productSubtitleTextStyle = GoogleFonts.montserrat(
      fontSize: 10,
      fontWeight: FontWeight.w900,
      color: ColorUiHelper.productSubtitleColor,
      height: 1);
  static TextStyle productSubtitleSecondTextStyle = GoogleFonts.montserrat(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: ColorUiHelper.productSubtitleColor,
      height: 1);

  static TextStyle productPriceTextStyle = GoogleFonts.montserrat(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: ColorUiHelper.productPriceColor,
      height: 1);

// details

  static TextStyle detailTitleTextStyle = GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.categoryTicketColor,
      height: 1);
  static TextStyle detailSubtitleTextStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorUiHelper.categoryTicketColor,
      height: 1);

  static TextStyle detailBoldSubtitleTextStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.categoryTicketColor,
      height: 1);

  static TextStyle detailButtonTextStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.detailCardColor,
      height: 1);
  static TextStyle detailButtonSecondaryTextStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.categoryTicketColor,
      height: 1);

  static TextStyle detailPriceTextStyle = GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.detailCardColor,
      height: 1);




// home page
  static TextStyle homePageStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.mainTitleYellow,
      height: 1.2);

  static TextStyle homeAppBarTitleStyle = GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: ColorUiHelper.mainSubtitleColor,
      height: 1.2);

  static TextStyle homeLabelStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.mainSubtitleColor,
      height: 1.2,
      shadows: [Shadow(color: ColorUiHelper.homePageSecondShadow , blurRadius: 5)]
      );
  static TextStyle homeCategoryNameStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ColorUiHelper.productTitleColor,
      height: 1,
      shadows: [Shadow(color: ColorUiHelper.homePageShadow , blurRadius: 5)]
      );

  static TextStyle homeAllButtonTextStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorUiHelper.categoryTicketColor,
      height: 0.5,
      );

  
  static TextStyle bottomNavigationTextStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorUiHelper.categoryTicketColor,
      height: 1,
      );



// add job page

  static TextStyle addJobTitleStyle = GoogleFonts.montserrat(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.mainTitleYellow,
      height: 1.2);


  static TextStyle addJobSubtitleStyle = GoogleFonts.montserrat(
      fontSize: 16,
      color: ColorUiHelper.mainSubtitleColor,
      fontWeight: FontWeight.w600,
      height: 1
      );

    static TextStyle addImageButtonTextStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 0.5,
      color: ColorUiHelper.mainTitleYellow);


    static TextStyle dropdownTextStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorUiHelper.inputHintColor,
      height: 1.2);

}
