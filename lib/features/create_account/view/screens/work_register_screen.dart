import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/router/app_route.dart';
import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/ElvatedButton.dart';
import '../widgets/workContainer.dart';
import '../../view_model/register_cubit.dart';

class RegisterWorkScreen extends StatefulWidget {
  const RegisterWorkScreen({Key? key}) : super(key: key);

  @override
  State<RegisterWorkScreen> createState() => _RegisterWorkScreenState();
}

class _RegisterWorkScreenState extends State<RegisterWorkScreen> {
  List workTypeList = [
    ["UI/UX Designer", Iconsax.bezier],

    ["Illustrator Designer", Iconsax.pen_tool],
    ["Developer", Iconsax.code],
    ["Management", Iconsax.graph],
    ["Information Technology", Iconsax.monitor_mobbile],
    ["Research and Analytics", Iconsax.cloud_add],


  ];
  late RegisterCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What type of work are you interested in?',
                          maxLines: 2,
                          style: TextStyle(
                            color: AppTheme.neutral9,
                            fontSize: 20.sp,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                        SizedBox(height: 1.h,),
                        Text(
                          'Tell us what you’re interested in so we can customise the app for your needs.',
                          style: TextStyle(
                            color: const Color(0xFF737379),
                            fontSize: 13.5.sp,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 3.6.h,),
                        BlocBuilder<RegisterCubit,RegisterState>(
                          builder: (context,state){
                            return GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.1,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 1.4.w,
                                  mainAxisSpacing: 2.h,
                                ),
                                itemCount: workTypeList.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return CustomWorkContainer(
                                      text: workTypeList[index][0], icon: workTypeList[index][1]);
                                });
                          }

                        ),


                        SizedBox(height: 10.h,),

                        //  const Spacer(),


                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomElevatedButton(() {
                        //cubit.userInterestedWork();
                        Navigator.pushNamedAndRemoveUntil(context, AppRoute.locationRegisterScreen, (route) => false);
                      }, "Next"))
                ],
              ),
            ),
          ),

        );

  }
}
