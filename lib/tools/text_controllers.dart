


import 'package:flutter/cupertino.dart';

class TextControllerHelper{

  //-----------------------------------------------------------
  // login Page Text Controllers

  static final loginEmailController = TextEditingController();
  static final loginPasswordController = TextEditingController();

  static void resetLoginTextControllers(){
    loginEmailController.clear();
    loginPasswordController.clear();
  }


  //-----------------------------------------------------------
  // register Page Text Controllers

  static final registerNameController = TextEditingController();

  static final registerEmailController = TextEditingController();

  static final registerPasswordController = TextEditingController();

  static void resetRegisterTextControllers(){
    registerEmailController.clear();
    registerNameController.clear();
    registerPasswordController.clear();
  }


  //-----------------------------------------------------------
  // Add Job Page Text Controllers
  static final addJobTitleController = TextEditingController();
  static final addJobLocationController = TextEditingController();
  static final addJobCostController = TextEditingController();
  static final addJobTimeController = TextEditingController();
  static final addJobDescriptionController = TextEditingController();

  static void resetAddJobTextControllers(){
    addJobTitleController.clear();
    addJobLocationController.clear();
    addJobCostController.clear();
    addJobTimeController.clear();
    addJobDescriptionController.clear();
  }

}