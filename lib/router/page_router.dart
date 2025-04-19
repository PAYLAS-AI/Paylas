



import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paylas/views/details/job_details_page.dart';
import 'package:paylas/views/jobs/jobs_page.dart';
import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/register/register_page.dart';
import 'package:paylas/views/view_router/view_router.dart';

class PageRouter {
  static Route<dynamic>?  onGenerateRoute(RouteSettings settings) {
    if(settings.name == "LoginPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => LoginPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => LoginPage(),);
      }
    }else if (settings.name == "RegisterPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => RegisterPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => RegisterPage(),);
      }
    }else if (settings.name == "HomePage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => ViewRouter(),);
      }else{
        return CupertinoPageRoute(builder: (context) => ViewRouter(),);
      }
    }else if (settings.name == "JobsPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => JobsPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => JobsPage(),);
      }
    }else if (settings.name == "DetailsPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => JobDetailsPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => JobDetailsPage(),);
      }
    }
    return null;
  }

}