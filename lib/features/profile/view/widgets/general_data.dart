import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/features/profile/view/widgets/profile_tile.dart';
import 'package:jobsque/core/router/app_route.dart';
import 'package:sizer/sizer.dart';

class GeneralDataListTile extends StatelessWidget {
  const GeneralDataListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [

           CustomSystemTile(
            'Edit Profile',
            icon: Iconsax.user,
            onTap: (){
              Navigator.pushNamed(context, AppRoute.editDetailsScreen);
            },
          ),
          const Divider(),
           CustomSystemTile(
            'Portfolio',
            icon: Iconsax.folder_favorite,
             onTap: (){
              Navigator.pushNamed(context, AppRoute.portfolioScreen);
             },
          ),
          const Divider(),
           CustomSystemTile(
            'Langauge',
            icon: Iconsax.global,
            onTap: (){
              Navigator.pushNamed(context, AppRoute.languageScreen);
            },
          ),
          const Divider(),
           CustomSystemTile(
            'Notification',
            icon: Iconsax.notification,
             onTap: (){
              Navigator.pushNamed(context, AppRoute.notificationsSettingsScreen);
             },
          ),
          const Divider(),
           CustomSystemTile(
            'Login and security',
            icon: Iconsax.lock,
             onTap: (){
              Navigator.pushNamed(context, AppRoute.loginAndSecurityScreen);
              // Navigator.of(context).pushNamed(AppRoute.loginAndSecurityScreen,)
              // Navigator.of(context).push(route)
             },
          ),
          SizedBox(height: 2.h),

        ],

      ),
    );
  }
}
