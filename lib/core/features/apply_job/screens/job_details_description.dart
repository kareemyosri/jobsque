import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../util/styles/color.dart';

class JobDetailsDescription extends StatelessWidget {
  const JobDetailsDescription({Key? key}) : super(key: key);

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
              'Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.',
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
              'A strong visual portfolio with clear understanding of UI methodologies\nAbility to create hi-fidelity mock-ups in Figma\nAbility to create various graphics for the web e.g. illustrations and icons\nAble to facilitate workshops and liaise with stakeholders\nProficiency in the Adobe Creative Suite\nConfident communicator with an analytical mindset\nDesign library/Design system experience\n4+ years of commercial experience in UI/Visual Design',
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
