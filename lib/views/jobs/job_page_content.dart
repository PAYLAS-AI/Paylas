
// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/models/model/categoryby.dart';
import 'package:paylas/models/job/job.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/text_controllers.dart';
import 'package:paylas/views/jobs/job_box.dart';
import 'package:paylas/views/jobs/jobs_filter_bar.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';
import 'package:paylas/views/widgets/job_pages_header.dart';

// ignore: must_be_immutable
class JobsPageContent extends ConsumerStatefulWidget {
  JobsPageContent({super.key, required this.jobs, required this.selectedCategory});
  List<Job> jobs;
  CategoryBy selectedCategory;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobsPageContentState();
}

class _JobsPageContentState extends ConsumerState<JobsPageContent> {
  late List<Job> jobs;
  @override
  void initState() {
    super.initState();
    jobs = widget.jobs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              JobsPagesHeader(
                iconAsset: widget.selectedCategory == CategoryBy.all ? "assets/icon/categories/all.png" : widget.selectedCategory == CategoryBy.services ? "assets/icon/categories/services.png" : (widget.selectedCategory == CategoryBy.shoppings ? "assets/icon/categories/shopping.png" : (widget.selectedCategory == CategoryBy.handicrafts ? "assets/icon/categories/handicrafts.png" : (widget.selectedCategory == CategoryBy.craftsmanship ? "assets/icon/categories/craftsmanship.png" : "assets/icon/categories/education.png") ) ),
                label: widget.selectedCategory == CategoryBy.all ? "Tüm İlanlar" : widget.selectedCategory == CategoryBy.services ? "Hizmetler" : (widget.selectedCategory == CategoryBy.shoppings ? "Ürünler" : (widget.selectedCategory == CategoryBy.handicrafts ? "El Becerisi" : (widget.selectedCategory == CategoryBy.craftsmanship ? "Ustalık" : "Eğitim") ) ),
              ),
              JobsFilterBar(
                onChanged: (value) {
                  setState(() {
                    widget.jobs = filteredList(value);
                  });
                },
              ),
              
              Flexible(
                child: jobs.isEmpty ? Center(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorUiHelper.homePageSecondShadow,
                                      blurRadius: 5,
                                      spreadRadius: 5)
                                ]),
                            child: Text(
                              "İş İlanı Yok!",
                              style: TextStyleHelper.pastJobsEmptyStyle,
                            )),
                      ) :
                GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(widget.jobs.length, (index) => JobBox(
                  imageUrl: "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
                  title: widget.jobs[index].title,
                  jobOwner: "${widget.jobs[index].ownerId} Bey",
                  score: 4.8,
                  onTap: () {
                    ref.read(detailsPageCurrentJobProvider.notifier).state = widget.jobs[index];
                    Navigator.of(context).pushNamed("DetailsPage");
                  },
                )),
                ),
              )
            ],
          );
  }

   List<Job> filteredList(String value){
    var newJobs = jobs;
    return newJobs.where((element) => element.title.contains(value) || element.description.contains(value),).toList();
  }

  @override
  void dispose() {
    TextControllerHelper.resetFilterTextControllers();
    super.dispose();
  }
}