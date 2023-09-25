

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/presentation/screens/onborading_model.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:sizer/sizer.dart';

Widget boardingItem(OnboardingModel model,context){
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(model.image, ),
        SizedBox(height: 0.5.h,),
        Padding(
          padding:  const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Text(model.title, style:   TextStyle(
            fontSize: 27.sp,
            fontWeight: FontWeight.w500,
            fontFamily:'SFProDisplay',
            color: AppTheme.neutral9,
          ),//maxLines: 2,
          ),
        ),
         SizedBox(height: 0.5.h,),
        Padding(
          padding:  const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Center(
            child: Text(model.body, style:  TextStyle(
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w400,
              fontFamily:'SFProDisplay',
              color: AppTheme.neutral5,
            ),
            //maxLines: 2,

            ),
          ),
        ),
      ],
    ),
  );
}

