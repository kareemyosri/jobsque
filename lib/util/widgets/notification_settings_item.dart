import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Models/NotificationSettingsModel.dart';
import '../styles/color.dart';

class CustomNotificationsSettingItem extends StatelessWidget {
  final NotificationSettingsModel setting;
  final Color? textColor;
  final double? fontSize;
  const CustomNotificationsSettingItem(this.setting, {super.key, this.textColor=AppTheme.neutral9, this.fontSize=13.5});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        setting.label,
        style:  TextStyle(
          color: textColor,
          fontSize: fontSize!.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,

        ),
      ),
      trailing: CupertinoSwitch(
        // overrides the default green color of the track
        activeColor: AppTheme.primary5,
        // color of the round icon, which moves from right to left
        thumbColor:setting.mode? AppTheme.primary1: AppTheme.neutral1,
        // when the switch is off
        trackColor: AppTheme.neutral3,
        // boolean variable value
        value: setting.mode,
        onChanged: (value) {},
      ),
    );
  }
}