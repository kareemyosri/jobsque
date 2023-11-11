import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';

class AppliedScreenNotFound extends StatelessWidget {
  const AppliedScreenNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/home/Search Ilustration.svg"),
            SizedBox(height: 3.h,),
            Text(
              'Nothing has been applied yet',
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
              'Try applying in different jobs so we can show you',
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
