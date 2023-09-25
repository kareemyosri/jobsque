import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/app_bar.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Complete Profile',context),
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height: 3.h),
              CircularPercentIndicator(
                radius: 41.5.sp,
                lineWidth: 8.0,
                percent: 0.50,
                center:  Text(
                  '50%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.primary5,
                    fontSize: 20.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),
                ),
                progressColor: AppTheme.primary5,
                circularStrokeCap: CircularStrokeCap.round,
              ),
               SizedBox(height: 2.h),
               Text(
                '2/4 Completed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.primary5,
                  fontSize: 13.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
               SizedBox(height: 1.h),
               Text(
                'Complete your profile before applying for a job',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.neutral5,
                  fontSize: 13.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              ),
              SizedBox(height: 3.h),
              const CompleteProfileTile(
                title: 'Personal Details',
                subtitle: 'Full name, email, phone number, and your address',
                isCompleted: true,
              ),
              const CompleteProfileTile(
                title: 'Education',
                subtitle:
                'Enter your educational history to be considered by the recruiter',
              ),
              const CompleteProfileTile(
                title: 'Experience',
                subtitle:
                'Enter your work experience to be considered by the recruiter',
              ),
              const CompleteProfileTile(
                title: 'Portfolio',
                subtitle:
                'Create your portfolio. Applying for various types of jobs is easier.',
                isNotLast: false,
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
class CompleteProfileTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted, isNotLast;

  const CompleteProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.isNotLast = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: ShapeDecoration(
            color: isCompleted ? Color(0xFFE0EAFF) : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isCompleted ? Colors.blue : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Padding(
              padding:  EdgeInsets.only(right: 1.h),
              child: Icon(

                Iconsax.tick_circle5,
                color: isCompleted ? AppTheme.primary5 : AppTheme.neutral4,
                size: 28,
              ),
            ),
            title: Text(
              title,
              style:  TextStyle(
                color: AppTheme.neutral9,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            subtitle: Text(
              subtitle,
              style:  TextStyle(
                color: AppTheme.neutral5,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            trailing: const Icon(Iconsax.arrow_right_1),
          ),
        ),
      ),
      Visibility(
        visible: isNotLast,
        child: SizedBox(
          height: 20,
          child: VerticalDivider(
            // width: 5,
            // thickness: ,
            color: isCompleted ? Colors.blue : AppTheme.neutral3,
          ),
        ),
      ),
    ]);
  }
}