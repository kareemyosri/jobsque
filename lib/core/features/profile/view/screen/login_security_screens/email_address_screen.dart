import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

import '../../../../../../util/styles/color.dart';
import '../../../../../../util/widgets/ElvatedButton.dart';
import '../../../../../../util/widgets/TextFormField.dart';
import '../../../../../../util/widgets/app_bar.dart';


class EmailAddressScreen extends StatelessWidget {
   EmailAddressScreen({Key? key}) : super(key: key);
  TextEditingController emailController=TextEditingController(text: 'rafifdian12@gmail.com');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar("Email Address", context),
      body: Padding(
        padding: const EdgeInsets.all( 24.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Main e-mail address',
                  style: TextStyle(
                    color: AppTheme.neutral9,
                    fontSize: 13.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
                SizedBox(height: 1.h,),
                CustomTextFormField(controller: emailController,
                  prefixIcon: const Icon(Iconsax.sms),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.focused)
                      ? AppTheme.neutral9
                      : AppTheme.neutral3),
                  hintText: 'Email address', obscureText: false,),
                const Spacer(),
                CustomElevatedButton(() { }, "Save"),
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
