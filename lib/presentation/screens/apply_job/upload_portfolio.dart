import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../styles/color.dart';
import '../../widgets/portfolio_item.dart';
import '../../widgets/upload_file.dart';

class UploadPortfolio extends StatelessWidget {
  const UploadPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Portfolio',
              style: TextStyle(
                color:AppTheme.neutral9,
                fontSize: 16.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            Text(
              'Fill in your bio data correctly',
              style: TextStyle(
                color: AppTheme.neutral5,
                fontSize: 11.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 3.h,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Upload CV',
                    style: TextStyle(
                      color: AppTheme.neutral9,
                      fontSize: 13.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: AppTheme.danger5,
                      fontSize: 13.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 1.h),
            ListView.builder(
              padding: EdgeInsets.zero,
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>  CustomPortfolioItem()
            ),

            SizedBox(height: 2.h,),


            Text(
              'Other File',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 1.h,),
            const UploadFile(),




            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
