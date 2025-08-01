// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:paylas/locator/locator.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/services/auth/auth_service.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/views/details/details_card.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class JobDetailsPage extends ConsumerWidget {
  JobDetailsPage({super.key});

  final screen = locator<ScreenSizes>();


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Job currentJob = ref.read(detailsPageCurrentJobProvider)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
          width: screen.width,
          height: screen.height,
          child: Stack(
            children: [
              Container(
                width: screen.width,
                height: screen.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          currentJob.imgUrl),
                      fit: BoxFit.fill),
                ),
              ),
              JobDetails(
                imgUrl: currentJob.imgUrl,
                jobId: currentJob.id!,
                ownerId: currentJob.ownerId,
                category: currentJob.category,
                userId: AuthService().auth.currentUser!.uid,
                title: currentJob.title,
                favoriteCount: 13,
                jobOwner: currentJob.ownerName,
                score: 4.8,
                description:
                    currentJob.description,
                location: " ${currentJob.location}",
                jobDuration: currentJob.validityDate,
                jobPrice: currentJob.price,
                jobDate:currentJob.createdDate
              ),
              Positioned(
                left: 30,
                child: Container(
                  height: screen.height * 0.18,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icon/v-ticket.png"),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Paylaş",
                        style: TextStyleHelper.categoryTitleStyle,
                      ),
                      Image.asset(
                        "assets/logo/logo4.png",
                        height: screen.height * 0.075,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
