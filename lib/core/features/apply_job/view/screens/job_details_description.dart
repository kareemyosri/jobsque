import 'package:flutter/material.dart';
import 'package:jobsque/core/features/home/model/job_model.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../saved_job/model/favourite_model.dart';


class JobDetailsDescription extends StatelessWidget {
  final JobData jobData;
  const JobDetailsDescription({Key? key, required this.jobData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job Description',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 11.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              jobData.jobDescription!,
              textAlign:TextAlign.justify ,

              style: TextStyle(
                color: AppTheme.neutral6,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 2.h,),
            Text(
              'Skill Required',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 11.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              jobData.jobSkill!,
              textAlign:TextAlign.justify ,

              style: TextStyle(
                color: AppTheme.neutral6,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            )
          ],
        ),
      ),
    );
  }
}
