import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/features/home/view_model/home_cubit.dart';
import 'package:jobsque/features/profile/view_model/profile_cubit.dart';
import 'package:jobsque/core/router/app_route.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/shimmer/shimmer_container_effect.dart';
import '../../../../../core/shimmer/shimmer_recently_jobs_list_view.dart';
import '../../../../../core/shimmer/shimmer_suggested_job.dart';
import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/job_status_item.dart';
import '../widgets/recent_job_item.dart';
import '../../../../../core/widgets/search_bar.dart';
import '../widgets/suggested_job_item.dart';
import '../../../notification/view/notification_screen.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  late HomeCubit cubit;
  late ProfileCubit profileCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = HomeCubit.get(context);
    profileCubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 0, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if(profileCubit.profile.isNotEmpty){
                    return Text(
                      '${profileCubit.profile[0].name}👋',
                      style: TextStyle(
                        color: AppTheme.neutral9,
                        fontSize: 20.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,

                      ),
                    );
                  }
                  else{
                    return ShimmerContainerEffect(
                      height: 1.2.h,
                      width: MediaQuery.of(context).size.width / 2.5,
                    );
                  }

                },
              ),
              SizedBox(height: 0.8.h,),
              Text(
                'Create a better future for yourself here',
                style: TextStyle(
                  color: AppTheme.neutral5,
                  fontSize: 11.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 0.8.h,),

            ],
          ),
        ),
        actions: [

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
            child: Container(
                width: 48,
                height: 48,
                //  padding: const EdgeInsets.all(12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppTheme.neutral3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Center(
                  child: IconButton(onPressed: () {

                    Navigator.pushNamed(context, AppRoute.notificationScreen);
                  },
                      icon: const Icon(Iconsax.notification)
                  ),
                )
            ),
          ),


        ],


      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBar(
                  keyboardType: TextInputType.none,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.searchScreen);
                  },
                  controller: searchController, hintText: "Search...."),
              SizedBox(height: 2.h,),
              const JobStatusItem(title: 'Twitter',
                subTitle: 'Waiting to be selected by the twitter team',
                isAccepted: true,),
              SizedBox(height: 2.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggested Job',
                    style: TextStyle(
                      color: AppTheme.neutral9,
                      fontSize: 15.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text(
                    'View all',
                    style: TextStyle(
                      color: AppTheme.primary5,
                      fontSize: 11.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  )),
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return BuildCondition(
                    condition: cubit.recentJobsData.isNotEmpty,
                    builder: (context) =>
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  SuggestedJobItem(
                                    jobData: cubit.suggestJobsData[index],),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 4.w,),
                              itemCount: cubit.suggestJobsData.length),
                        ),

                    fallback: (context) =>
                    const ShimmerSuggestedJob(),
                  );
                },
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Job',
                    style: TextStyle(
                      color: AppTheme.neutral9,
                      fontSize: 15.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text(
                    'View all',
                    style: TextStyle(
                      color: AppTheme.primary5,
                      fontSize: 11.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  )),
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return BuildCondition(
                    condition: cubit.recentJobsData.isNotEmpty,
                    builder: (context) =>
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                RecentJobItem(
                                  jobData: cubit.recentJobsData[index],
                                ),
                            separatorBuilder: (context,
                                index) => const Divider(),
                            itemCount: cubit.recentJobsData.length),

                    fallback: (context) =>
                    const ShimmerRecentlyListView(),
                  );
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
