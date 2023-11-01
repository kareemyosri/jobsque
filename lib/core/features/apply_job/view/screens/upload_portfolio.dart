import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/features/apply_job/view_model/job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../widgets/portfolio_item.dart';
import '../widgets/upload_file.dart';


class UploadPortfolio extends StatefulWidget {
  const UploadPortfolio({Key? key}) : super(key: key);

  @override
  State<UploadPortfolio> createState() => _UploadPortfolioState();
}

class _UploadPortfolioState extends State<UploadPortfolio> {
  late JobCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = JobCubit.get(context);
  }

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
                color: AppTheme.neutral9,
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
            SizedBox(height: 1.h),

            const UploadFile(target: 'CV',),

            //SizedBox(height: 1.h),
            BlocBuilder<JobCubit, JobState>(
              builder: (context, state) {
                return BuildCondition(
                  condition: cubit.selectedCVFile != null,
                  builder: (context) =>
                      CustomPortfolioItem(text: cubit.selectedCVFile!
                          .path
                          .split('/')
                          .last, size: ((cubit.selectedCVFile!.lengthSync())/1024/1024).toStringAsFixed(2),),
                  fallback: (context) => const SizedBox.shrink(),

                );
              },
            ),


            // ),

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
            const UploadFile(target: 'Other',),
            BlocBuilder<JobCubit, JobState>(
              builder: (context, state) {
                return BuildCondition(
                  condition: cubit.selectedOtherFile != null,
                  builder: (context) =>
                      CustomPortfolioItem(text: cubit.selectedOtherFile!
                          .path
                          .split('/')
                          .last, size: ((cubit.selectedOtherFile!.lengthSync())/1024/1024).toStringAsFixed(2),isImage: true,),
                  fallback: (context) => const SizedBox.shrink(),

                );
              },
            ),



            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
