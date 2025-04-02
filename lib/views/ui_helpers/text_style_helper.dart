


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';

class TextStyleHelper {
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

}