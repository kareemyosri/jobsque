import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/app_bar.dart';
import '../../../../../util/widgets/header.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            SizedBox(
              height: MediaQuery.of(context).size.height*0.25,
              width: double.infinity,
              child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      color: AppTheme.primary1,
                    ),
                    Positioned(
                        top: 135,
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: const ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZClNi2dGGXiI5K7tZaMrc2CT6Ysy5zmeBXaORUA7dz2ZNFYeR"),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(
                              side: BorderSide(width: 2, color: Colors.white),
                            ),
                          ),
                        ))
                  ]),
            ),
            SizedBox(height: 5.h),
            Text(
             'Rafif Dian Axelingga',
             style: TextStyle(
               color: AppTheme.neutral9,
               fontSize: 17.sp,
               fontFamily: 'SFProDisplay',
               fontWeight: FontWeight.w500,

             ),
                ),
            SizedBox(height: 0.2.h),
            Text(
             'Senior UI/UX Designer',
             style: TextStyle(
               color: AppTheme.neutral5,
               fontSize: 12.sp,
               fontFamily: 'SFProDisplay',
               fontWeight: FontWeight.w400,

             ),
                ),
            SizedBox(height: 2.h),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24),
             child: Column(
               children: [
                 Container(
                   width: MediaQuery.of(context).size.width,
                   height: 11.h,
                   padding:
                   const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                   decoration: ShapeDecoration(
                     color:  const Color(0xFFFAFAFA),
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(8)),
                   ),
                   child:  const Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       CustomCounter(counterName: 'Applied', counter: 46),
                       VerticalDivider(),
                       CustomCounter(counterName: 'Reviewed', counter: 23),
                       VerticalDivider(),
                       CustomCounter(counterName: 'Contacted', counter: 16),
                     ],
                   ),
                 ),
                  SizedBox(height:1.h),
                 const UserAbout(),
                  SizedBox(height: 2.5.h),

               ],
             ),

           ),
            const CustomHeader('General'),
             SizedBox(height: 1.h,),


             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [

                  const CustomSystemTile(
                    'Edit Profile',
                    icon: Iconsax.user,
                  ),
                  const Divider(),
                  const CustomSystemTile(
                    'Portfolio',
                    icon: Iconsax.folder_favorite,
                  ),
                  const Divider(),
                  const CustomSystemTile(
                    'Langauge',
                    icon: Iconsax.global,
                  ),
                  const Divider(),
                  const CustomSystemTile(
                    'Notification',
                    icon: Iconsax.notification,
                  ),
                  const Divider(),
                  const CustomSystemTile(
                    'Login and security',
                    icon: Iconsax.lock,
                  ),
                  SizedBox(height: 2.h),

                ],

              ),
            ),
            const CustomHeader('Others'),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomSystemTile('Accesibility', withIcon: false),

                  CustomSystemTile('Help Center', withIcon: false),
                  CustomSystemTile('Terms & Conditions', withIcon: false),
                  CustomSystemTile('Privacy Policy', withIcon: false),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserAbout extends StatelessWidget {
  const UserAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'About',
              style: TextStyle(
                color: AppTheme.neutral5,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            TextButton(
                onPressed: () {},
                child:  Text(
                  'Edit',
                  style: TextStyle(
                    color: AppTheme.primary5,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),
                ))
          ],
        ),
        SizedBox(height: 0.5.h),
        Text(
          'I\'m Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.',
          style: TextStyle(
            color: AppTheme.neutral5,
            fontSize: 11.5.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,

          ),
        ),
      ],
    );
  }
}


class CustomCounter extends StatelessWidget {
  final String counterName;
  final int counter;
  const CustomCounter(
      {super.key, required this.counterName, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            counterName,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: AppTheme.neutral5,
              fontSize: 11.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),
          Text(
            counter.toString(),
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: AppTheme.neutral9,
              fontSize: 13.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),
        ],
      ),
    );
  }
}

class CustomSystemTile extends StatelessWidget {
  final String title;
  final bool withIcon;
  final IconData? icon;
  const CustomSystemTile(this.title,
      {this.icon, this.withIcon = true, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: withIcon
          ? Container(
        height: 5.h,
        width: 10.5.w,
        decoration: const BoxDecoration(
            color: AppTheme.primary1, shape: BoxShape.circle),
        child: Center(child: Icon(icon,color: AppTheme.primary5,)),
      )
          : null,
      title: Text(
        title,
        style:  TextStyle(
          color: AppTheme.neutral9,
          fontSize: 13.5.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,

        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon:  Icon(Iconsax.arrow_right_1, size: 13.5.sp),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
