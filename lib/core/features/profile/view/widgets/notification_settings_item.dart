import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/features/profile/view_model/profile_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../model/NotificationSettingsModel.dart';
import '../../../../../util/styles/color.dart';

class CustomNotificationsSettingItem extends StatefulWidget {
  final NotificationSettingsModel setting;
  final int index;
  final bool? otherNotifications;
  final Color? textColor;
  final double? fontSize;

  const CustomNotificationsSettingItem(this.setting,
      {super.key, this.textColor = AppTheme
          .neutral9, this.fontSize = 13.5, required this.index, this.otherNotifications = false});

  @override
  State<CustomNotificationsSettingItem> createState() =>
      _CustomNotificationsSettingItemState();
}

class _CustomNotificationsSettingItemState
    extends State<CustomNotificationsSettingItem> {
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.setting.label,
        style: TextStyle(
          color: widget.textColor,
          fontSize: widget.fontSize!.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,

        ),
      ),
      trailing: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return CupertinoSwitch(
            // overrides the default green color of the track
            activeColor: AppTheme.primary5,
            // color of the round icon, which moves from right to left
            thumbColor: widget.setting.mode ? AppTheme.primary1 : AppTheme
                .neutral1,
            // when the switch is off
            trackColor: AppTheme.neutral3,
            // boolean variable value
            value: widget.setting.mode,
            onChanged: (value) {
              if (widget.otherNotifications!) {
                cubit.selectSettingNotificationItem(
                    otherNotificationettings, widget.index, value);
              }
              else {
                cubit.selectSettingNotificationItem(
                    notificationettings, widget.index, value);
              }
            },
          );
        },
      ),
    );
  }
}