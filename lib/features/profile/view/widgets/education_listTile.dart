import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';

class EducationListTile extends StatelessWidget {

  final String image;
  final String title;
  final String bachelor;
  final String date;


   const EducationListTile({Key? key, required this.image, required this.title, required this.bachelor, required this.date}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network(image, width: 11.w, height: 5.h),
          title: Text(
            title,
            style:  TextStyle(
              color: AppTheme.neutral9,
              fontSize: 13.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bachelor,
                      style:  TextStyle(
                        color: AppTheme.neutral5,
                        fontSize: 11.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                      )),
                  Text(date,
                      style:  TextStyle(
                        color: AppTheme.neutral5,
                        fontSize: 11.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(
                      Iconsax.edit_2,
                      size: 24.0,
                      color: AppTheme.primary5,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              )
            ],
          ),
          // trailing: IconButton(
          //   onPressed: () {
          //
          //   },
          //   icon: const Icon(
          //     Iconsax.edit_2,
          //     size: 24.0,
          //     color: AppTheme.primary5,
          //   ),
          // ),
          contentPadding: EdgeInsets.zero,

        ),

      ],
    );
  }
}
