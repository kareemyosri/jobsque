import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/notificationModel.dart';
import '../../../../../core/styles/color.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(notification.img), radius: 21.sp),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notification.company,
            style:  TextStyle(
              color: AppTheme.neutral9,
              fontSize: 12.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              notification.status
                  ? Container()
                  : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 3.w,
                  height: 1.h,
                  decoration: const BoxDecoration(
                    color: AppTheme.warning6,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                notification.datetime,
                style:  TextStyle(
                  color: AppTheme.neutral5,
                  fontSize: 10.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              )
            ],
          ),
        ],
      ),
      subtitle: Text(
        notification.subtitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style:  TextStyle(
          color: AppTheme.neutral5,
          fontSize: 10.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
        ),
      ),
        contentPadding:EdgeInsets.zero,

    );
  }
}