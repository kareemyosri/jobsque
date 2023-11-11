import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/router/app_route.dart';
import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/ElvatedButton.dart';
import '../../../../../core/widgets/home_indicator.dart';

class CheckMailForgotPasswordScreen extends StatelessWidget {
  const CheckMailForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/auth/Email Ilustration.svg"),
            SizedBox(height: 2.h,),
            Text(
              'Check your Email',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 20.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              'We have sent a reset password to your email address',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.neutral5,
                fontSize: 12.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            const Spacer(),
            CustomElevatedButton(() {
              Navigator.pushNamed(context, AppRoute.createNewPasswordScreen);
            }, "Open email app"),
          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36,
          child: homeIndicator(context)),
    );
  }
}
