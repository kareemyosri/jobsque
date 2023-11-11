import 'package:flutter/material.dart';

import '../../model/NotificationSettingsModel.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/header.dart';
import '../widgets/notification_settings_item.dart';


class NotificationsSettingsScreen extends StatelessWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Notification',context),
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomHeader('Job notification'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: notificationettings.length,
              itemBuilder: (BuildContext context, int index) =>
                  CustomNotificationsSettingItem(notificationettings[index],index: index,),
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            ),
          ),
          const CustomHeader('Other notification'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: otherNotificationettings.length,
              itemBuilder: (BuildContext context, int index) =>
                  CustomNotificationsSettingItem(otherNotificationettings[index],index: index,otherNotifications: true,),
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
        ]),
      ),
    );
  }
}