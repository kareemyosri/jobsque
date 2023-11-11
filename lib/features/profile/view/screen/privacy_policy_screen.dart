import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/app_bar.dart';

class PrivacyAndPolicyScreen extends StatelessWidget {
  const PrivacyAndPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Privacy Policy", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your privacy is important',
                style: TextStyle(
                  color: AppTheme.neutral9,
                  fontSize: 16.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                style: TextStyle(
                  color: Color(0xFF75788D),
                  fontSize: 11.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                'Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                style: TextStyle(
                  color: Color(0xFF75788D),
                  fontSize: 11.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              ),
              SizedBox(height: 3.h,),
              Text(
                'Data controllers and contract partners',
                style: TextStyle(
                  color: AppTheme.neutral9,
                  fontSize: 16.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                style: TextStyle(
                  color: Color(0xFF75788D),
                  fontSize: 11.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
