import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/features/apply_job/view/screens/job_details_pepole.dart';
import 'package:jobsque/core/features/apply_job/view_model/job_cubit.dart';
import 'package:jobsque/core/features/home/model/job_model.dart';
import 'package:jobsque/util/router/app_route.dart';

import 'package:sizer/sizer.dart';


import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/ElvatedButton.dart';
import '../../../../../util/widgets/app_bar.dart';
import '../../../../../util/widgets/job_feature.dart';
import '../widgets/menu_bar.dart';
import 'job_details_company.dart';
import 'job_details_description.dart';

class JobDetails extends StatefulWidget {
  final JobData jobData;

  const JobDetails({Key? key, required this.jobData}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  late JobCubit cubit;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = JobCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Job detail", context,
          actions: [
            const Icon(Iconsax.archive_minus5, color: AppTheme.primary5,)
          ]
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 65.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.jobData.image!, width: 48, height: 48,),
                    SizedBox(height: 1.h,),
                    Text(
                      widget.jobData.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppTheme.neutral9,
                        fontSize: 16.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                    Text(
                      '${widget.jobData.compName} • ${widget.jobData
                          .location} ',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.neutral7,
                        fontSize: 10.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                    SizedBox(height: 2.h,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        JobFeature(text: widget.jobData.jobTimeType!,),
                        JobFeature(text: widget.jobData.jobType!,),
                      ],
                    ),
                    SizedBox(height: 4.h,)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocBuilder<JobCubit, JobState>(
                  builder: (context, state) {
                    return CustomMenuBar(pageController: pageController,);
                  },
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics:const NeverScrollableScrollPhysics(),
                  children: [
                    JobDetailsDescription(jobData: widget.jobData,),
                    JobDetailsCompany(jobData: widget.jobData,),
                    JobDetailsPepole()
                  ],                  // onPageChanged: (index) {

                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Align(

                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(() {
                  Navigator.pushNamed(context, AppRoute.applyJobScreen);
                }, "Apply now")),
          )
        ],
      ),
    );
  }

}









