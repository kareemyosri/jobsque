import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/util/widgets/TextFormField.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/constants.dart';
import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/phone_textFormField.dart';



class BioDataScreen extends StatelessWidget {
   BioDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: formKey,
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
              validator: (value){
                if(value!.isEmpty){
                  return'cannot be empty';
                }
                else{
                  return null;
                }
              },
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
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'email must not be empty';
                }
                final bool isValid = EmailValidator.validate(value);
                if (!isValid) {
                  return "please enter right email";
                }
                return null;
              },
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
            CustomPhoneTextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return'cannot be empty';
                  }
                  if (value.length < 10) {


                    return 'Phone must be 11 characters';
                  }

                  else{
                    return null;
                  }
                },
                controller: phoneController),
          ],
        ),
      ),
    );
  }
}