import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/past_job/past_job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/past_jobs/past_job_content.dart';


class PastJobsView extends ConsumerWidget {
  PastJobsView({super.key});

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PastJob> pastJobs = ref.watch(pastJobsProvider);
    debugPrint(pastJobs.toString());
    debugPrint("1111111111111111111111");
    return Container(
      width: screen.width,
      height: screen.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
      child: SafeArea(
        child: PastJobsContent(key: ValueKey(pastJobs.hashCode),pastJobs: pastJobs),
      ),
    );
  }


}


