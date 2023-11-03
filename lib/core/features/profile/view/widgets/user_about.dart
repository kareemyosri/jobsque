import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';

class UserAbout extends StatelessWidget {
  const UserAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'About',
              style: TextStyle(
                color: AppTheme.neutral5,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            TextButton(
                onPressed: () {},
                child:  Text(
                  'Edit',
                  style: TextStyle(
                    color: AppTheme.primary5,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),
                ))
          ],
        ),
        SizedBox(height: 0.5.h),
        Text(
          'I\'m Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.',
          style: TextStyle(
            color: AppTheme.neutral5,
            fontSize: 11.5.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,

          ),
        ),
      ],
    );
  }
}
