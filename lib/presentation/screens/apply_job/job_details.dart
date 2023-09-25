import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/presentation/screens/apply_job/job_details_company.dart';
import 'package:jobsque/presentation/screens/apply_job/job_details_description.dart';
import 'package:jobsque/presentation/screens/apply_job/job_details_pepole.dart';
import 'package:jobsque/presentation/widgets/ElvatedButton.dart';
import 'package:jobsque/presentation/widgets/app_bar.dart';
import 'package:sizer/sizer.dart';

import '../../styles/color.dart';
import '../../widgets/job_feature.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({Key? key}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  int activeIndex = 0;
  PageController pageController=PageController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    Image.network("https://cdn-icons-png.flaticon.com/128/3536/3536424.png",width: 48,height: 48,),
                    SizedBox(height: 1.h,),
                    Text(
                      'Senior UI Designer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppTheme.neutral9,
                        fontSize: 16.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                    Text(
                      'Twitter • Jakarta, Indonesia ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppTheme.neutral7,
                        fontSize: 10.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                    SizedBox(height: 2.h,),
                    const Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        JobFeature(text: "Full time",),
                        JobFeature(text: "Remote",),
                        JobFeature(text: "Senior",),
                      ],
                    ),
                    SizedBox(height: 4.h,)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: _menuBar(context),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    const JobDetailsDescription(),
                    const JobDetailsCompany(),
                    JobDetailsPepole()
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Align(

                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(() { }, "Apply now")),
          )
        ],
      ),
    );
  }
  Widget _menuBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 6.h,
      decoration: const BoxDecoration(
        color: AppTheme.neutral1,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              onTap: () {
                setState(() {
                  activeIndex = 0;
                  pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (activeIndex == 0)
                    ? const BoxDecoration(
                  color: AppTheme.primary9,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Description",
                  style: (activeIndex == 0)
                      ?  TextStyle(
                    color: Colors.white,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,)
                      :  TextStyle(
                    color: AppTheme.neutral5,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),

                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              onTap: () {
                setState(() {
                  activeIndex = 1;
                  pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);

                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (activeIndex == 1)
                    ? const BoxDecoration(
                  color: AppTheme.primary9,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Company",
                  style: (activeIndex == 1)
                      ?  TextStyle(
                    color: Colors.white,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,)
                      :  TextStyle(
                    color: AppTheme.neutral5,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),

                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              onTap: () {
                setState(() {
                  activeIndex = 2;
                  pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);

                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (activeIndex == 2)
                    ? const BoxDecoration(
                  color: AppTheme.primary9,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Pepole",
                  style: (activeIndex == 2)
                      ?  TextStyle(
                    color: Colors.white,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,)
                      :  TextStyle(
                    color: AppTheme.neutral5,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}









