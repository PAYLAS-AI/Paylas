



import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paylas/models/user/app_user.dart';
import 'package:paylas/views/add_job/add_job_page.dart';
import 'package:paylas/views/details/job_details_page.dart';
import 'package:paylas/views/job_request/job_request_page.dart';
import 'package:paylas/views/jobs/jobs_page.dart';
import 'package:paylas/views/login/login_page.dart';
import 'package:paylas/views/profile/other_profile/profile_page.dart';
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
    }else if (settings.name == "AddJobPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => AddJobPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => AddJobPage(),);
      }
    }else if (settings.name == "OtherProfilePage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => OtherProfilePage(currentUser: settings.arguments as AppUser,),);
      }else{
        return CupertinoPageRoute(builder: (context) => OtherProfilePage(currentUser: settings.arguments as AppUser,),);
      }
    }else if (settings.name == "JobRequestPage"){
      if( defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => JobRequestPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => JobRequestPage(),);
      }
    }

    

    return null;
  }

}