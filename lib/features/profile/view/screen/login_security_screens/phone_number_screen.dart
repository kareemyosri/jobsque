import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../model/NotificationSettingsModel.dart';
import '../../../../../../core/styles/color.dart';
import '../../../../../../core/widgets/ElvatedButton.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../widgets/notification_settings_item.dart';
import '../../../../../../core/widgets/phone_textFormField.dart';



class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({Key? key}) : super(key: key);
  TextEditingController phoneController=TextEditingController(text: '0100-666-7234');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar("Phone Number", context),
      body: Padding(
        padding: const EdgeInsets.all( 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Main phone number',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 1.h,),
            CustomPhoneTextFormField(controller: phoneController,),
            SizedBox(height: 2.h,),
            // CustomNotificationsSettingItem(  NotificationSettingsModel(label: 'Use the phone number to reset your password', mode: true),
            // textColor: AppTheme.neutral5,
            //   fontSize: 11.5,
            //
            // ),
            const Spacer(),
            CustomElevatedButton(() { }, "Save"),

          ],
        ),
      ),
    );
  }
}
