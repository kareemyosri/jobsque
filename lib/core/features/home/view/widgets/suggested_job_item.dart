import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/features/home/model/job_model.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/router/app_route.dart';
import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/job_feature.dart';
import '../../../saved_job/model/favourite_model.dart';

class SuggestedJobItem extends StatelessWidget {
  final JobData jobData;

  const SuggestedJobItem({super.key,
   required this.jobData,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
     // height: 230,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: ShapeDecoration(
        color: AppTheme.primary9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Image.network(jobData.image!)),
            title: Text(
              jobData.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color:Colors.white,
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
                    color: AppTheme.neutral4,
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
                      color: AppTheme.neutral4,
                      fontSize: 10.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),
              ],
            ),


            trailing: IconButton(onPressed: () {  },
              icon: const Icon(Iconsax.archive_minus,color: Colors.white,),

            ),
            contentPadding: EdgeInsets.zero,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              JobFeature(text: jobData.jobTimeType!,color: Colors.white.withOpacity(0.14000000059604645),textColor: Colors.white,),
              SizedBox(width: 2.h,),
              JobFeature(text: jobData.jobType!,color: Colors.white.withOpacity(0.14000000059604645),textColor: Colors.white),
            ],
          ),
          SizedBox(height: 1.5.h,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text.rich(
               TextSpan(
                 children: [
                   TextSpan(
                     text: '\$${jobData.salary!}',
                     style: const TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                       fontFamily: 'SFProDisplay',
                       fontWeight: FontWeight.w500,

                     ),
                   ),
                   TextSpan(
                     text: '/Month',
                     style: TextStyle(
                       color: Colors.white.withOpacity(0.5),
                       fontSize: 12,
                       fontFamily: 'SFProDisplay',
                       fontWeight: FontWeight.w500,

                     ),
                   ),
                 ],
               ),
             ),
             ElevatedButton(onPressed: (){
               Navigator.pushNamed(context, AppRoute.jobDetailsScreen,arguments: jobData);

             },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: AppTheme.primary5,
                   padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(1000), // <-- Radius
                   ),
                 ),
                 child: Text("Apply now",
                   style:  TextStyle(
                     color: Colors.white,
                     fontSize: 10.sp,
                     fontFamily: 'SFProDisplay',
                     fontWeight: FontWeight.w500,
                   ),
                 ),)
             //CustomElevatedButton(() { }, "Apply now",width: ,)
           ],
         )

        ],
      ),
    );
  }


}
