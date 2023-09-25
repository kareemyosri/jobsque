import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:jobsque/presentation/widgets/job_feature.dart';
import 'package:sizer/sizer.dart';

class RecentJobItem extends StatelessWidget {
  final String jobTitle;
  final String jobSubTitle;
  const RecentJobItem({super.key,
    required this.jobTitle,
    required this.jobSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: Color(0xFF6690FF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: SvgPicture.asset("assets/images/home/twitter.svg")),
          title: Text(
            jobTitle,
            style: TextStyle(
              color:AppTheme.neutral9,
              fontSize: 15.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            jobSubTitle,
            style: TextStyle(
              color: AppTheme.neutral7,
              fontSize: 10.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          ),
          trailing: IconButton(onPressed: () {  },
            icon: const Icon(Iconsax.archive_minus),

          ),
          contentPadding: EdgeInsets.zero,

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          JobFeature(text: "Full time",),
          JobFeature(text: "Remote",),
          JobFeature(text: "Senior",),

         Column(
           children: [
             Text.rich(
               TextSpan(
                 children: [
                   TextSpan(
                     text: '\$15K',
                     style: TextStyle(
                       color: AppTheme.success7,
                       fontSize: 13.5.sp,
                       fontFamily: 'SFProDisplay',
                       fontWeight: FontWeight.w500,

                     ),
                   ),
                   TextSpan(
                     text: '/Month',
                     style: TextStyle(
                       color: AppTheme.neutral5,
                       fontSize: 10.sp,
                       fontFamily: 'SFProDisplay',
                       fontWeight: FontWeight.w500,

                     ),
                   ),
                 ],
               ),
             )
           ],
         )

        ],
        ),
      ],
    );
  }


}
