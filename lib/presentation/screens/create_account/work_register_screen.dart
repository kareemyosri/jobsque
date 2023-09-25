import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/business_logic/register/register_cubit.dart';
import 'package:jobsque/presentation/router/app_route.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:jobsque/presentation/widgets/ElvatedButton.dart';
import 'package:jobsque/presentation/widgets/home_indicator.dart';
import 'package:jobsque/presentation/widgets/workContainer.dart';
import 'package:sizer/sizer.dart';

class RegisterWorkScreen extends StatefulWidget {
  const RegisterWorkScreen({Key? key}) : super(key: key);

  @override
  State<RegisterWorkScreen> createState() => _RegisterWorkScreenState();
}

class _RegisterWorkScreenState extends State<RegisterWorkScreen> {
  List lis = [
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
                                itemCount: lis.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return CustomWorkContainer(
                                      text: lis[index][0], icon: lis[index][1]);
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
          bottomNavigationBar: FractionallySizedBox(
              widthFactor: 0.36,
              child: homeIndicator(context)),
        );

  }
}
