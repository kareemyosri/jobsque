import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';


class AppliedJobRejectedScreen extends StatelessWidget {
  const AppliedJobRejectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/home/Data.svg"),
            SizedBox(height: 3.h,),
            Text(
              'No applications were rejected',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 20.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              'If there is an application that is rejected by the company it will appear here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.neutral5,
                fontSize: 13.5.sp,
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
