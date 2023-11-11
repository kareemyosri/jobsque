import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/router/app_route.dart';
import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/ElvatedButton.dart';
import '../../../../../core/widgets/TextFormField.dart';
import '../../../../../core/widgets/home_indicator.dart';
import '../../../login/view_model/login_cubit.dart';

class ForgotPasswordScreen extends StatefulWidget {
   const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController= TextEditingController();

  late LoginCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit= LoginCubit.get(context);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SvgPicture.asset("assets/images/auth/Logo.svg")
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset Password',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 24.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
              style: TextStyle(
                color: AppTheme.neutral5,
                fontSize: 13.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 4.h,),
            CustomTextFormField(
                controller: emailController,
                prefixIcon: Icon(Iconsax.sms),
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? AppTheme.neutral9
                    : AppTheme.neutral3),
                hintText: "Enter your email",
                obscureText: false),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'You remember your password',
                    style: TextStyle(
                      color: AppTheme.neutral4,
                      fontSize: 14,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
                },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: AppTheme.primary5,
                        fontSize: 14,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    )),

              ],
            ),
            SizedBox(height: 2.h,),
            CustomElevatedButton(() {
              Navigator.pushNamed(context, AppRoute.checkEmailForgetPasswordScreen);
            }, "Request password reset")



          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36,
          child: homeIndicator(context)),
    );
  }
}
