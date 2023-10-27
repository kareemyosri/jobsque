import 'package:flutter/material.dart';
import 'package:jobsque/Models/notificationModel.dart';
import 'package:sizer/sizer.dart';

import '../../../../util/widgets/app_bar.dart';
import '../../../../util/widgets/header.dart';
import '../../../../util/widgets/notification_item.dart';
import 'notification_empty_screen.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;

    return Scaffold(
      appBar: customAppBar('Notification',context),
      body: !isEmpty
          ? SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader('New'),
              SizedBox(height: 1.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notifications.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NotificationItem(notifications[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(indent: 24.0, endIndent: 24.0),
                ),
              ),
              const CustomHeader('Yesterday'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: yesterdayNotifications.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NotificationItem(yesterdayNotifications[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(indent: 24.0, endIndent: 24.0),
                ),
              ),
            ],
          ))
          : const NotificationEmptyScreen(),
    );
  }
}
