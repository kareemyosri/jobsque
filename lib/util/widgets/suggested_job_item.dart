import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../styles/color.dart';
import 'job_feature.dart';

class SuggestedJobItem extends StatelessWidget {
  final String jobTitle;
  final String jobSubTitle;
  const SuggestedJobItem({super.key,
    required this.jobTitle,
    required this.jobSubTitle,
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
                child: SvgPicture.asset("assets/images/home/camera.svg")),
            title: Text(
              jobTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color:Colors.white,
                fontSize: 15.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              jobSubTitle,
              style: TextStyle(
                color: AppTheme.neutral4,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            trailing: IconButton(onPressed: () {  },
              icon: const Icon(Iconsax.archive_minus,color: Colors.white,),

            ),
            contentPadding: EdgeInsets.zero,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              JobFeature(text: "Full time",color: Colors.white.withOpacity(0.14000000059604645),textColor: Colors.white,),
              JobFeature(text: "Remote", color: Colors.white.withOpacity(0.14000000059604645),textColor: Colors.white),
              JobFeature(text: "Senior",color: Colors.white.withOpacity(0.14000000059604645),textColor: Colors.white),
            ],
          ),
          SizedBox(height: 2.h,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text.rich(
               TextSpan(
                 children: [
                   TextSpan(
                     text: '\$12K-15K',
                     style: TextStyle(
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
             ElevatedButton(onPressed: (){},
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
