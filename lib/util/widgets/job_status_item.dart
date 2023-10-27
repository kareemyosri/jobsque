import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../styles/color.dart';

class JobStatusItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isAccepted;

  const JobStatusItem({Key? key, required this.title, required this.subTitle, required this.isAccepted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppTheme.primary1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading:Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFF6690FF),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: SvgPicture.asset("assets/images/home/twitter.svg")) ,
        title: Text(
          title,
          style: TextStyle(
            color: const Color(0xFF222741),
            fontSize: 13.5.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,

          ),
        ),
        subtitle:Text(
          'Waiting to be selected by the twitter team',
          style: TextStyle(
            color: AppTheme.neutral7,
            fontSize: 10.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,

          ),
        ) ,
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: ShapeDecoration(
            color:isAccepted? AppTheme.success3:AppTheme.primary2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            isAccepted?
            'Accepted': 'Submited'  ,
            style: TextStyle(
              color: isAccepted? AppTheme.success8:AppTheme.primary7,
              fontSize: 10.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          ),
        ),
      ),
    );
  }
}
