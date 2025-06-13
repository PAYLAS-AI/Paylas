// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/job_admin_control_request/job_admin_control_request_service.dart';
import 'package:paylas/services/job_report_request/job_report_request_service.dart';
import 'package:paylas/views/admin/admin_appbar.dart';
import 'package:paylas/views/admin/created_job_content.dart';
import 'package:paylas/views/admin/report_content.dart';

class AdminPage extends ConsumerStatefulWidget {
  const AdminPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminPageState();
}
class _AdminPageState extends ConsumerState<AdminPage> {

  final adminRequestControlService = locator<JobAdminControlRequestService>();
  final reportRequestService = locator<JobReportRequestService>();

  @override
  void initState() {
    super.initState();
    getAllRequests();
    getAllReports();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AdminAppbar.appBar(ref),
          body: TabBarView(
            children: [
              CreatedJobContent(),
              ReportContent(),
            ],
          )),
    );
  }

  void getAllRequests()async{
    ref.read(adminJobRequestsProvider.notifier).state = await adminRequestControlService.getAllAdminControlRequests();
  }

  void getAllReports() async {
    ref.read(adminReportRequestsProvider.notifier).state = await reportRequestService.getAllReportRequests();
  }
}
