import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';

class CustomAccountAccessTile extends StatelessWidget {
  final String title;
  final String? trailingTitle;
  final  void Function()? onTap;
  const CustomAccountAccessTile( {super.key, required this.title,  this.trailingTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:  TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral9,
                  fontFamily: 'SFProDisplay',
                )),
            SizedBox(width: 5.w,),
            trailingTitle != null
                ? Flexible(
              child: SizedBox(
                width: 150,
                child: Row(

                  children: [
                    Expanded(
                      child: Text(trailingTitle!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style:  TextStyle(
                            fontSize: 11.5.sp, fontWeight: FontWeight.w400,
                            fontFamily: 'SFProDisplay',
                            color: AppTheme.neutral5,
                          )),
                    ),
                    const Icon(Iconsax.arrow_right_1)
                  ],
                ),
              ),
            )
                : const Icon(Iconsax.arrow_right_1),
          ],
        ),
      ),
    );
  }
}