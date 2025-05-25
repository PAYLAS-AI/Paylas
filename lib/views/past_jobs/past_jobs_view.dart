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
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg/2.png"), fit: BoxFit.fill)),
      child: SafeArea(
        child: PastJobsContent(pastJobs: pastJobs, filteredPastJobs: [...pastJobs],),
      ),
    );
  }


}


