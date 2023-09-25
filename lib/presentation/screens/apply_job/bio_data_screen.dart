import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/TextFormField.dart';
import '../../widgets/phone_textFormField.dart';

class BioDataScreen extends StatelessWidget {
   BioDataScreen({super.key});
TextEditingController usernameController=TextEditingController();
TextEditingController emailController=TextEditingController();
TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Biodata',
            style: TextStyle(
              color: AppTheme.neutral9,
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
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Full Name',
                  style: TextStyle(
                    color: AppTheme.neutral9,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: AppTheme.danger5,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h,),
          CustomTextFormField(
            controller: usernameController,
            hintText: "Username",
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Iconsax.user),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? AppTheme.neutral9
                : AppTheme.neutral3),
            obscureText: false,

          ),
          SizedBox(height: 2.h,),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Email',
                  style: TextStyle(
                    color: AppTheme.neutral9,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: AppTheme.danger5,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h,),
          CustomTextFormField(
            controller: emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Iconsax.sms),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? AppTheme.neutral9
                : AppTheme.neutral3),
            obscureText: false,

          ),
          SizedBox(height: 2.h,),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'No.Headphone',
                  style: TextStyle(
                    color: AppTheme.neutral9,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: AppTheme.danger5,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h,),
          CustomPhoneTextFormField(controller: phoneController),
        ],
      ),
    );
  }
}