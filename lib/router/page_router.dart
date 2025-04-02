



import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/register/register_page.dart';

class PageRouter {
  static Route<dynamic>?  onGenerateRoute(RouteSettings settings) {
    if(settings.name == "loginPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => LoginPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => LoginPage(),);
      }
    }else if (settings.name == "registerPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => RegisterPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => RegisterPage(),);
      }
    }
    return null;
  }

}