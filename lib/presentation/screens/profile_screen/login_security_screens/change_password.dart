import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:jobsque/presentation/widgets/app_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/ElvatedButton.dart';
import '../../../widgets/TextFormField.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  TextEditingController oldPasswordController=TextEditingController(text: 'rafifdian12@gmail.com');
  TextEditingController newPasswordController=TextEditingController(text: 'rafifdian12@gmail.com');
  TextEditingController confirmNewPasswordController=TextEditingController(text: 'rafifdian12@gmail.com');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar("Change password", context),
      body: Padding(
        padding: const EdgeInsets.all( 24.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h,),
                Text(
                  'Enter your old password',
                  style: TextStyle(
                    color: AppTheme.neutral9,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
                SizedBox(height: 1.h,),
                CustomTextFormField(
                  controller: oldPasswordController,
                  hintText: "Old Password",
                  prefixIcon: const Icon(Iconsax.lock),
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
                SizedBox(height: 2.h,),
                Text(
                  'Enter your new password',
                  style: TextStyle(
                    color: AppTheme.neutral9,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
                SizedBox(height: 1.h,),
                CustomTextFormField(
                  controller: newPasswordController,
                  hintText: "Old Password",
                  prefixIcon: const Icon(Iconsax.lock),
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
                SizedBox(height: 2.h,),

                Text(
                  'Confirm your new password',
                  style: TextStyle(
                    color: AppTheme.neutral9,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
                SizedBox(height: 1.h,),
                CustomTextFormField(
                  controller: confirmNewPasswordController,
                  hintText: "Old Password",
                  prefixIcon: const Icon(Iconsax.lock),
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

              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(() { }, "Save")),
          ],
        ),
      ),
    );
  }
}
