import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../styles/color.dart';

AppBar customAppBar(String title,context,{List<Widget>? actions,Color? backgroundColor,bool? leading=true}) {
  return AppBar(
    leading: leading!?  IconButton(onPressed:
       () { Navigator.pop(context); },


      icon: const Icon(Iconsax.arrow_left),) : const SizedBox.shrink()  ,
    actions: actions,
    backgroundColor: backgroundColor ,
    title: Text(title,
        style:  TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SFProDisplay',
            color: AppTheme.neutral9
        )),
    centerTitle: true,
  );
}