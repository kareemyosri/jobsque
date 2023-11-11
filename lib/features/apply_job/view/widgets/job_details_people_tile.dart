import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';

class JobDetailsPeopleTile extends StatelessWidget {
   JobDetailsPeopleTile({Key? key, required this.image, required this.name, required this.job, required this.yearsOfExp}) : super(key: key);
  final String image;
  final String name;
  final String job;
  final String yearsOfExp;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image, width: 5.h, height: 5.h),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style:  TextStyle(
              color: AppTheme.neutral9,
              fontSize: 11.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Work during',
            //textAlign: TextAlign.right,
            style: TextStyle(
              color: AppTheme.neutral5,
              fontSize: 10.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(job,
              style:  TextStyle(
                color: AppTheme.neutral5,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
              )),
          Text(
            yearsOfExp,
            //textAlign: TextAlign.right,
            style: TextStyle(
              color:AppTheme.primary5,
              fontSize: 10.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),

        ],
      ),

      contentPadding: EdgeInsets.zero,

    );
  }
}
