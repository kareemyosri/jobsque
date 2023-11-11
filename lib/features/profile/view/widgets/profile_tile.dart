import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';

class CustomSystemTile extends StatelessWidget {
  final String title;
  final bool withIcon;
  final IconData? icon;
  final void Function()? onTap;
  const CustomSystemTile(this.title,
      {this.icon, this.withIcon = true, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: withIcon
          ? Container(
        height: 5.h,
        width: 10.5.w,
        decoration: const BoxDecoration(
            color: AppTheme.primary1, shape: BoxShape.circle),
        child: Center(child: Icon(icon,color: AppTheme.primary5,)),
      )
          : null,
      title: Text(
        title,
        style:  TextStyle(
          color: AppTheme.neutral9,
          fontSize: 13.5.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,

        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon:  Icon(Iconsax.arrow_right_1, size: 13.5.sp),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
