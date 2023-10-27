import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../styles/color.dart';

class TypeofWorkTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected ;
  final int value;

  const TypeofWorkTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSelected = false, required this.value,

  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: ShapeDecoration(
            color: isSelected ? Color(0xFFE0EAFF) : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isSelected ? AppTheme.primary5 : AppTheme.neutral3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,

            title: Text(
              title,
              style:  TextStyle(
                color: AppTheme.neutral9,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            subtitle: Text(
              subtitle,
              style:  TextStyle(
                color: AppTheme.neutral5,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            trailing: Radio(
              value: value,
              groupValue: 2,
              activeColor: AppTheme.primary5,
              splashRadius: 25,
              onChanged: (value) {},
            ),
          ),
        ),
      ),
    ]);
  }
}