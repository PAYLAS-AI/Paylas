// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:paylas/views/admin/admin_appbar.dart';
import 'package:paylas/views/admin/created_job_content.dart';
import 'package:paylas/views/admin/report_content.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AdminAppbar.appBar(),
          body: TabBarView(
            children: [
              CreatedJobContent(),
              ReportContent(),
            ],
          )),
    );
  }
}
