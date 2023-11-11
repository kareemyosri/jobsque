import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/profile/view_model/profile_cubit.dart';
import 'package:jobsque/core/widgets/ElvatedButton.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/router/app_route.dart';
import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../../apply_job/view/widgets/portfolio_item.dart';
import '../widgets/upload_file.dart';


class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Portfolio', context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            SingleChildScrollView(
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
              const UploadFile(target: 'CV',),

              //SizedBox(height: 1.h),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return BuildCondition(
                    condition: cubit.selectedCVFile != null,
                    builder: (context) =>
                        CustomPortfolioItem(text: cubit.selectedCVFile!
                            .path
                            .split('/')
                            .last,
                          size: ((cubit.selectedCVFile!.lengthSync()) / 1024 /
                              1024).toStringAsFixed(2),
                          selectedFile: cubit.selectedCVFile!,),
                    fallback: (context) => const SizedBox.shrink(),

                  );
                },
              ),
              SizedBox(height: 1.h),

              //! Portfiolos List
              // ListView.builder(
              //     itemCount: 3,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) =>  const CustomPortfolioItem(text: 'test', size: '200',)),

              SizedBox(height: 2.h),
              ],
            ),),
            Align(
              alignment: Alignment.bottomCenter,
              child:  BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is AddItemCompleteProfile) {
                    showSuccessSnackBar(
                        context: context,
                        message: 'Portfolio Updated Successfully');
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(() {
                    cubit.addItem('Portfolio');
                  }, 'Save');
                },
              ),

            )
          ],
        ),
      )
    ,
    );
  }
}