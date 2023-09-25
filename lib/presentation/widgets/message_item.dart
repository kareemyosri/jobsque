import 'package:flutter/material.dart';
import 'package:jobsque/Models/messageModel.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:sizer/sizer.dart';

class MessageItem extends StatelessWidget {
  final MessageModel messageModel;
  const MessageItem(this.messageModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.topLeft,
        children: [
          CircleAvatar(
              backgroundImage: NetworkImage(messageModel.img), radius: 21.sp),
          messageModel.status?
          SizedBox():
          Container(
            width: 4.w,
            height: 2.h,
            decoration: ShapeDecoration(
              color: AppTheme.primary5,
              shape: RoundedRectangleBorder(
                side: const BorderSide( color: Colors.white),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Center(
              child: Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
            ),
          )
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            messageModel.name,
            style:  TextStyle(
              color: AppTheme.neutral9,
              fontSize: 12.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),

          Text(
            messageModel.datetime,
            style:  TextStyle(
              color: messageModel.status? AppTheme.neutral5: AppTheme.primary5,
              fontSize: 10.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          ),
        ],
      ),
      subtitle: Text(
        messageModel.message,
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