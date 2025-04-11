



import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paylas/views/category/category_page.dart';
import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/past_jobs/past_jobs_page.dart';
import 'package:paylas/views/profile/profile_page.dart';
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
    }else if (settings.name == "categoryPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => CategoryPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => CategoryPage(),);
      }
    }else if (settings.name == "profilePage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => ProfilePage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => ProfilePage(),);
      }
    }else if (settings.name == "pastJobsPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => PastJobsPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => PastJobsPage(),);
      }
    }
    return null;
  }

}