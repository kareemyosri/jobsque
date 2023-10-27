import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/app_bar.dart';
import '../../../../../util/widgets/header.dart';


class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Login and security',context),
      body:  const SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader('Account access'),
              
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    CustomAccountAccessTile(title: "Email address", trailingTitle: 'rafifdsdsdsdsianhjhjjgkgjkgkj12@gmail.com'),
                    CustomAccountAccessTile(title: "Phone number"),
                    CustomAccountAccessTile(title: "Change Password"),
                    CustomAccountAccessTile(
                      title: 'Two-step verification',
                      trailingTitle: 'Non active',
                    ),
                    CustomAccountAccessTile(title: 'Face ID'),


                  ],
                ),
              ),

            ],
          )),
    );
  }
}

class CustomAccountAccessTile extends StatelessWidget {
  final String title;
  final String? trailingTitle;
  const CustomAccountAccessTile( {super.key, required this.title,  this.trailingTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:  TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral9,
                  fontFamily: 'SFProDisplay',
                )),
            SizedBox(width: 5.w,),
            trailingTitle != null
                ? Flexible(
                  child: SizedBox(
                   width: 150,
                    child: Row(

                      children: [
                        Expanded(
                          child: Text(trailingTitle!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style:  TextStyle(
                                  fontSize: 11.5.sp, fontWeight: FontWeight.w400,
                                fontFamily: 'SFProDisplay',
                              color: AppTheme.neutral5,
                              )),
                        ),
                        const Icon(Iconsax.arrow_right_1)
                      ],
                    ),
                  ),
                )
                : const Icon(Iconsax.arrow_right_1),
          ],
        ),
      ),
    );
  }
}