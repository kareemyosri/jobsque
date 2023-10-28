import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/type_of_work_item_tile.dart';



class TypeOfWorkScreen extends StatelessWidget {
  const TypeOfWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type Of Work',
            style: TextStyle(
              color:AppTheme.neutral9,
              fontSize: 16.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),
          Text(
            'Fill in your bio data correctly',
            style: TextStyle(
              color: AppTheme.neutral5,
              fontSize: 11.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          ),
          SizedBox(height: 3.h,),
           const TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 1,),
           SizedBox(height: 2.h,),
           const TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 2,isSelected: true,),
          SizedBox(height: 2.h,),
          const TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 3,),
          SizedBox(height: 2.h,),
          const TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 4,),

          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
