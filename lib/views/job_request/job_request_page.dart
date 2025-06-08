// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:paylas/views/job_request/incoming_requests_content.dart';
import 'package:paylas/views/job_request/job_request_appbar.dart';
import 'package:paylas/views/job_request/sended_requests_content.dart';

class JobRequestPage extends StatelessWidget {
  const JobRequestPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: JobRequestAppBar.appBar(),
          body: TabBarView(
            children: [
              SendedRequestsContent(),
              IncomingRequestsContent(),
            ],
          )),
    );
  }
}

