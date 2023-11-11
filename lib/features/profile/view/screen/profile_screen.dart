import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/features/profile/view_model/profile_cubit.dart';
import 'package:jobsque/core/database/local_database/cache_helper.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/core/router/app_route.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/animations/slide_transition_animation.dart';
import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/header.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../../home/view_model/home_cubit.dart';
import '../widgets/general_data.dart';
import '../widgets/others_data.dart';
import '../widgets/personal_details.dart';
import '../widgets/profile_header.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=ProfileCubit.get(context)

      ..loadSavedProfileImage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        'Profile',context,leading: false,
        actions: [
          IconButton(
            onPressed: () {
              CashHelper.removeCacheKey(key: MySharedKeys.token).then((value) {

               // cubit.close();
              //  HomeCubit.get(context).close();
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
                showSuccessSnackBar(context: context, message: 'Logged out Successfully');

              });

            },
            icon: const Icon(
              Iconsax.logout_1,
              color: Colors.red,
            ),
          )
        ],
        backgroundColor: AppTheme.primary1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [



          const SlideTransitionAnimation(duration: Duration(seconds:1), begin:  Offset(0, 0.2), end: Offset.zero,
            child:  ProfileHeader(),),
            const SlideTransitionAnimation(duration: Duration(seconds:1), begin:  Offset(0, 0.2), end: Offset.zero,
                child:  ProfilePersonalDetails()),

            const CustomHeader('General'),
             SizedBox(height: 1.h,),
            const GeneralDataListTile(),
            const CustomHeader('Others'),
            const OtherDataListTile()
          ],
        ),
      ),
    );
  }
}




