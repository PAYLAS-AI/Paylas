


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';

class TextStyleHelper {




// Login - Register Pages
  static TextStyle loginTitleStyle = GoogleFonts.montserrat(
      fontSize: 46, fontWeight: FontWeight.bold, color: ColorUiHelper.mainTitleYellow , height: 1.2); 

  static TextStyle loginTitle2Style = GoogleFonts.montserrat(
      fontSize: 46, fontWeight: FontWeight.bold, color: ColorUiHelper.mainTitleBlue , height: 1.2 , shadows: [ Shadow(color: ColorUiHelper.mainTitleShadow, blurRadius: 5)]);     

  static TextStyle loginSubtitle2Style = GoogleFonts.montserrat(
      fontSize: 16, color: ColorUiHelper.mainSubtitleColor , fontWeight: FontWeight.w200);  


  static TextStyle forgotPasswordTextStyle = GoogleFonts.montserrat(
      fontSize: 12, color: ColorUiHelper.inputSecondDarkColor);

  static TextStyle loginButtonTextStyle = GoogleFonts.montserrat(
      fontSize: 14, color: ColorUiHelper.mainSubtitleColor );    

  static TextStyle registerTextStyle = GoogleFonts.montserrat(
      fontSize: 14, color: ColorUiHelper.inputSecondDarkColor , fontWeight: FontWeight.w600);  





// Category Page
  static TextStyle categoryTitleStyle = GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.bold, color: ColorUiHelper.mainTitleYellow , height: 1.2); 

  static TextStyle categorySubitleStyle = GoogleFonts.montserrat(
      fontSize: 20, fontWeight: FontWeight.w300, color: ColorUiHelper.mainSubtitleColor , height: 1 , letterSpacing: 2); 

  static TextStyle categoryContentStyle = GoogleFonts.montserrat(
      fontSize: 18, fontWeight: FontWeight.w300, color: ColorUiHelper.mainSubtitleColor , height: 1, letterSpacing: 1.2); 

  static TextStyle categoryContentSecondarStyle = GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w800, color: ColorUiHelper.categoryTicketColor , height: 1); 



// Profile page
  static TextStyle profileDetailStyle = GoogleFonts.montserrat(
      fontSize: 14, color: ColorUiHelper.profileGradiendPrimary , height: 1); 

  static TextStyle profileDetailUnderlineStyle = GoogleFonts.montserrat(
      fontSize: 14, color: ColorUiHelper.profileGradiendPrimary , height: 1 , decoration: TextDecoration.underline,); 

      static TextStyle profileDetailCounterStyle = GoogleFonts.montserrat(
      fontSize: 24, color: ColorUiHelper.profileGradiendPrimary,fontWeight: FontWeight.w600 ,); 
}