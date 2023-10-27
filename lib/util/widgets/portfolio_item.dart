import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../styles/color.dart';

class CustomPortfolioItem extends StatelessWidget {
  const CustomPortfolioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppTheme.neutral3),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.network(
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRZJY2YZTyHwVQqbb9Dzsrz2bAdR2JfJCzito195cDsUnjnjCSf',
            width: 5.5.h,
            height: 5.5.h,
          ),
          title:  Text(
            'UI/UX Designer',
            style: TextStyle(
              color: AppTheme.neutral9,
              fontSize: 11.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            'CV.pdf 300KB',
            style: TextStyle(
              color: AppTheme.neutral5,
              fontSize: 10.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: SizedBox(
            width: 27.w,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {  },
                  icon: Icon(
                    Iconsax.edit_2,
                    color: AppTheme.primary5,
                    size: 20.sp,
                  ),

                ),
                IconButton(onPressed: () {  },
                  icon: Icon(
                    Iconsax.close_circle,
                    color: AppTheme.danger5,
                    size: 20.sp,
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}