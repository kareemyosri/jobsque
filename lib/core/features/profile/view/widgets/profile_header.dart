import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/features/profile/view_model/profile_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  color: AppTheme.primary1,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if(state is PickImageLoading){
                        return const Center(child: CircularProgressIndicator());
                      }
                      if( cubit.savedImage!=null){
                        return Container(
                            width: 90,
                            height: 90,
                            decoration: ShapeDecoration(
                              image:
                                   DecorationImage(
                                image: FileImage(cubit.savedImage!),
                                fit: BoxFit.fill,
                              )
                                ,
                              shape: const OvalBorder(
                                side: BorderSide(width: 2, color: Colors.white),
                              ),
                            ));
                      }

                      else{
                        return Container(
                            width: 90,
                            height: 90,
                            decoration: const ShapeDecoration(
                              image:DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZClNi2dGGXiI5K7tZaMrc2CT6Ysy5zmeBXaORUA7dz2ZNFYeR"),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(width: 2, color: Colors.white),
                              ),
                            ));
                      }

                    },
                  ),
                )
              ]),
        ),
        SizedBox(height: 5.h),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (cubit.profile.isNotEmpty) {
              return Text(
                cubit.profile[0].name!,
                style: TextStyle(
                  color: AppTheme.neutral9,
                  fontSize: 17.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        SizedBox(height: 0.2.h),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (cubit.profileDetails.isNotEmpty) {
              return Text(
                cubit.profileDetails[0].interestedWork!,
                style: TextStyle(
                  color: AppTheme.neutral5,
                  fontSize: 12.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
