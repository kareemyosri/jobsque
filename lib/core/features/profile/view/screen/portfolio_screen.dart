import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/app_bar.dart';
import '../../../apply_job/view/widgets/portfolio_item.dart';
import '../../../apply_job/view/widgets/upload_file.dart';


class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Portfolio',context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Add portfolio here',
                style: TextStyle(
                  color: AppTheme.neutral9,
                  fontSize: 16.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 2.h),
              //! Dashed Container
              //const UploadFile(),
              SizedBox(height: 1.h),

              //! Portfiolos List
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>  const CustomPortfolioItem(text: 'test', size: '200',)),

              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}