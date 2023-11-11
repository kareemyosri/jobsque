import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/color.dart';

class CustomBottomSheet extends StatelessWidget {
  final List<Widget> items;
  final bool isTitled;
  final String? text;
  const CustomBottomSheet({super.key, required this.items,  this.isTitled=false,  this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: const EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Column(

        children: [
          Container(
            height: 6.0,
            width: MediaQuery.of(context).size.width*0.2,
            // padding: const EdgeInsets.all(14),
            decoration: ShapeDecoration(
              color: AppTheme.neutral8,
              shape: RoundedRectangleBorder(
                side: const BorderSide( color: AppTheme.neutral8),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
           SizedBox(height: 3.h),
          isTitled? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text!,
                style: TextStyle(
                  color: AppTheme.neutral9,
                  fontSize: 15.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
            ],
          ):SizedBox(),
          Column(
            children: items,
          )

        ],
      ),
    );
  }
}