import 'package:flutter/material.dart';
import 'package:paylas/views/add_job/add_job_page_content.dart';


class AddJobPage extends StatelessWidget {
  const AddJobPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AddPageContent(),
    );
  }
}

