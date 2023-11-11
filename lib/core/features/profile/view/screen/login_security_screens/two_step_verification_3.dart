import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/util/router/app_route.dart';

import 'package:sizer/sizer.dart';

import '../../../../../../util/styles/color.dart';
import '../../../../../../util/widgets/ElvatedButton.dart';
import '../../../../../../util/widgets/TextFormField.dart';
import '../../../../../../util/widgets/app_bar.dart';
import '../../../../../../util/widgets/phone_textFormField.dart';



class TwoStepVerification3 extends StatelessWidget {
   TwoStepVerification3({Key? key}) : super(key: key);
   TextEditingController phoneController=TextEditingController(text: '0100-666-7234');
   TextEditingController passwordController=TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  customAppBar("Two-step verification", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add phone number',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 0.5.h,),
            Text(
              'We will send a verification code to this number',
              style: TextStyle(
                color: AppTheme.neutral5,
                fontSize: 11.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 2.h,),
            CustomPhoneTextFormField(controller: phoneController,),
            SizedBox(height: 2.h,),
            Text(
              'Enter your password',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 1.h,),
            CustomTextFormField(
              controller: passwordController,
              hintText: "Password",
              prefixIcon:  const Icon(Iconsax.lock),
              prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? AppTheme.neutral9
                  : AppTheme.neutral3),
              suffixIcon: IconButton(onPressed: () {  },
                icon: const Icon(Iconsax.eye_slash),
              ),
              suffixIconColor:MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? AppTheme.neutral9
                  : AppTheme.neutral4),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const Spacer(),
            CustomElevatedButton(() {
              Navigator.pushNamed(context, AppRoute.twoStepVerification4);
            }, "Send Code"),

          ],
        ),
      ),
    );
  }
}
