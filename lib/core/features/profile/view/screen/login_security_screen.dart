import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/util/database/local_database/cache_helper.dart';
import 'package:jobsque/util/enums.dart';
import 'package:jobsque/util/router/app_route.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/app_bar.dart';
import '../../../../../util/widgets/header.dart';
import '../widgets/account_access_tile.dart';


class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Login and security',context),
      body:   SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader('Account access'),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    CustomAccountAccessTile(title: "Email address", trailingTitle: CashHelper.getString(key: MySharedKeys.email),
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.emailAddressScreen);
                    },
                    ),
                    CustomAccountAccessTile(title: "Phone number",
                      onTap: (){
                        Navigator.pushNamed(context, AppRoute.phoneNumberScreen);
                      },
                    ),
                    CustomAccountAccessTile(title: "Change Password",
                      onTap: (){
                        Navigator.pushNamed(context, AppRoute.changePasswordScreen);
                      },
                    ),
                    CustomAccountAccessTile(
                      title: 'Two-step verification',
                      trailingTitle: 'Non active',
                      onTap: (){
                        Navigator.pushNamed(context, AppRoute.twoStepVerification1);
                      },
                    ),
                    const CustomAccountAccessTile(title: 'Face ID'),


                  ],
                ),
              ),

            ],
          )),
    );
  }
}

