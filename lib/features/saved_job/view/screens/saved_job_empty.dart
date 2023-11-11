import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/app_bar.dart';



class SavedJobEmptyScreen extends StatelessWidget {
  const SavedJobEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/home/Saved Ilustration.svg'),
            SizedBox(height: 2.h),
            Text(
              'Nothing has been saved yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 20.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            Text(
              'Press the star icon on the job you want to save.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.neutral5,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
          ],
        ),
      ),
    );

  }
}
