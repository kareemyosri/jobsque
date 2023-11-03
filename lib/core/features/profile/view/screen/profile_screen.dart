import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/features/profile/view_model/profile_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/app_bar.dart';
import '../../../../../util/widgets/header.dart';
import '../widgets/counter.dart';
import '../widgets/general_data.dart';
import '../widgets/others_data.dart';
import '../widgets/personal_details.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_tile.dart';
import '../widgets/user_about.dart';


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
    cubit=ProfileCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        'Profile',context,
        actions: [
          IconButton(
            onPressed: () {},
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
            const ProfileHeader(),
            const ProfilePersonalDetails(),
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




