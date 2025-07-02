// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/services/job_request/job_request_service.dart';
import 'package:paylas/views/job_request/incoming_requests_content.dart';
import 'package:paylas/views/job_request/job_request_appbar.dart';
import 'package:paylas/views/job_request/sended_requests_content.dart';


class JobRequestPage extends ConsumerStatefulWidget {
  const JobRequestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobRequestPageState();
}

class _JobRequestPageState extends ConsumerState<JobRequestPage> {

  final requestService = locator<JobRequestService>();



  @override
  Widget build(BuildContext context) {
    ref.watch(updateRequestPageProvider);
    getRequests();
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

  void getRequests() async {
    debugPrint("Get requests");
    ref.read(incomingJobRequestsProvider.notifier).state = await requestService.getJobRequestForOwnerId(AuthService().auth.currentUser!.uid); // gelen istekler
    ref.read(sendedJobRequestsProvider.notifier).state = await requestService.getJobRequestsForUserId(AuthService().auth.currentUser!.uid); // gönderilen istekler
  }

}

