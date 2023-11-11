import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/profile/view_model/profile_cubit.dart';
import 'package:jobsque/core/router/app_route.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/ElvatedButton.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../home_layout/view_model/layout_cubit.dart';
import '../widgets/complete_profile_tile.dart';

class CompleteProfileScreen extends StatefulWidget {
  // final String percentage;
  // final double percent;

  const CompleteProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
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
      appBar: customAppBar('Complete Profile', context, leading: false),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 3.h),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return CircularPercentIndicator(
                        radius: 41.5.sp,
                        lineWidth: 8.0,
                        percent:
                            (cubit.completeProfile.length * 0.25).toDouble(),
                        center: Text(
                          '${cubit.completeProfile.length * 25}%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppTheme.primary5,
                            fontSize: 20.sp,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        progressColor: AppTheme.primary5,
                        circularStrokeCap: CircularStrokeCap.round,
                      );
                    },
                  ),
                  SizedBox(height: 2.h),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return Text(
                        '${cubit.completeProfile.length}/4 Completed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppTheme.primary5,
                          fontSize: 13.5.sp,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Complete your profile before applying for a job',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.neutral5,
                      fontSize: 13.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return CompleteProfileTile(
                        title: 'Personal Details',
                        subtitle:
                            'Full name, email, phone number, and your address',
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoute.editDetailsScreen);
                        },
                      );
                    },
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return CompleteProfileTile(
                        title: 'Education',
                        subtitle:
                            'Enter your educational history to be considered by the recruiter',
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoute.educationScreen);
                        },
                      );
                    },
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return CompleteProfileTile(
                        title: 'Experience',
                        subtitle:
                            'Enter your work experience to be considered by the recruiter',
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoute.experienceScreen);
                        },
                      );
                    },
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return CompleteProfileTile(
                        title: 'Portfolio',
                        subtitle:
                            'Create your portfolio. Applying for various types of jobs is easier.',
                        isNotLast: false,
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoute.portfolioScreen);
                        },
                      );
                    },
                  ),
                   SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
          BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Visibility(
                visible: cubit.completeProfile.length == 4,
                child: Align(
                  alignment: Alignment.bottomCenter,

                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: CustomElevatedButton(() {
                      LayoutCubit.get(context).getCompleteProfile();
                      Navigator.pushNamedAndRemoveUntil(context, AppRoute.layoutScreen, (route) => false);
                    }, 'Save'),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
