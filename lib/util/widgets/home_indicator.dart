import 'package:flutter/material.dart';
import 'package:jobsque/util/styles/color.dart';
import 'package:sizer/sizer.dart';

homeIndicator(context){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 0.5.h),
    child: Container(
      width: MediaQuery.of(context).size.width*0.36,
      height: 5,
      decoration: ShapeDecoration(
        color: AppTheme.neutral8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
  );
}