import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/features/home/model/job_model.dart';
import 'package:jobsque/util/router/app_route.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/job_feature.dart';

class RecentJobItem extends StatelessWidget {
  final JobData jobData;

  const RecentJobItem({super.key,
     required this.jobData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: (){
            Navigator.pushNamed(context, AppRoute.jobDetailsScreen,arguments: jobData);
          },
          leading: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color(0xFF6690FF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Image.network(jobData.image!)
          ),
          title: Text(
            jobData.name!,
            style: TextStyle(
              color:AppTheme.neutral9,
              fontSize: 15.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                jobData.compName!,
                style: TextStyle(
                  color: AppTheme.neutral7,
                  fontSize: 10.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              ),
              Expanded(
                child: Text(
                  "• ${jobData.location!}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppTheme.neutral7,
                    fontSize: 10.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
              ),
            ],
          ),
          trailing: IconButton(onPressed: () {  },
            icon: const Icon(Iconsax.archive_minus),

          ),
          contentPadding: EdgeInsets.zero,

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           JobFeature(text: jobData.jobTimeType!,),
         // const JobFeature(text: "Remote",),
           JobFeature(text: jobData.jobType!,),

         Column(
           children: [
             Text.rich(
               TextSpan(
                 children: [
                   TextSpan(
                     text: '\$${jobData.salary!}',
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
