import 'package:flutter/material.dart';
import 'package:jobsque/util/styles/color.dart';
import 'package:sizer/sizer.dart';

class JobFeature extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const JobFeature({super.key,
    required this.text,
    this.color=AppTheme.primary1,
    this.textColor=AppTheme.primary5
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 3.5.h,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 10.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,

          ),
        ),
      ),
    );
  }


}
