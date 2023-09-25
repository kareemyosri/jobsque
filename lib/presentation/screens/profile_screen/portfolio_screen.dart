import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:jobsque/presentation/widgets/app_bar.dart';
import 'package:jobsque/presentation/widgets/portfolio_item.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/upload_file.dart';

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
              const UploadFile(),
              SizedBox(height: 1.h),

              //! Portfiolos List
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const CustomPortfolioItem()),

              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}