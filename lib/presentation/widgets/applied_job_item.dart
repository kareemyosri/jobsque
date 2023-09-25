import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/presentation/widgets/stepper_indicator.dart';
import 'package:sizer/sizer.dart';

import '../styles/color.dart';
import 'job_feature.dart';

class AppliedJobItem extends StatelessWidget {
    AppliedJobItem({Key? key, required this.jobTitle, required this.jobSubTitle}) : super(key: key);
  final String jobTitle;
  final String jobSubTitle;
   int currentStep = 0;


   @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color(0xFF6690FF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: SvgPicture.asset("assets/images/home/twitter.svg")),
          title: Text(
            jobTitle,
            style: TextStyle(
              color:AppTheme.neutral9,
              fontSize: 15.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            jobSubTitle,
            style: TextStyle(
              color: AppTheme.neutral7,
              fontSize: 10.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          ),
          trailing: IconButton(onPressed: () {  },
            icon: const Icon(Iconsax.archive_minus),

          ),
          contentPadding: EdgeInsets.zero,

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const JobFeature(text: "Full time",),
            SizedBox(width: 2.w,),
            const JobFeature(text: "Remote",),

            const Spacer(),


            Column(
              children: [
                Text(
                  'Posted 2 days ago',
                 // textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppTheme.neutral7,
                    fontSize: 10.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                )
              ],
            )

          ],
        ),
        SizedBox(height: 1.5.h,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height*0.10,

          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide( color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StepIndication(

                  1, "Bio Data", currentStep >= 0,
                  raduis: 4.h,
                ),
                StepIndication(
                  2, 'Type of work', currentStep >= 1,
                  raduis: 4.h,
                ),
                StepIndication(
                    3, 'Upload portfolio', currentStep >= 2,
                    lineState: false,
                raduis: 4.h,
                ),
              ]
          ),
        ),
      ],
    );
  }
}
