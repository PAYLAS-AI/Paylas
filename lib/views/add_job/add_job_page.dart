
import 'package:flutter/material.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/add_job/add_job_form.dart';
import 'package:paylas/views/add_job/add_job_header.dart';



class AddJobPage extends StatelessWidget {
  AddJobPage({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screen.width,
        height: screen.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            children: [
              AddJobHeader(),
              Flexible(
                child: AddJobForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

