import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/business_logic/register/register_cubit.dart';
import 'package:jobsque/presentation/router/app_route.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:jobsque/presentation/widgets/ElvatedButton.dart';
import 'package:jobsque/presentation/widgets/country.dart';
import 'package:sizer/sizer.dart';

class LocationRegisterScreen extends StatefulWidget {
  const LocationRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LocationRegisterScreen> createState() => _LocationRegisterScreenState();
}

class _LocationRegisterScreenState extends State<LocationRegisterScreen> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Where are you preferred Location?',
                      style: TextStyle(
                        color: AppTheme.neutral9,
                        fontSize: 20.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Let us know, where is the work location you want at this time, so we can adjust it.',
                      style: TextStyle(
                        color: const Color(0xFF737379),
                        fontSize: 14.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    _menuBar(context),
                    SizedBox(
                      height: 2.4.h,
                    ),
                    const Text(
                      'Select the country you want for your job',
                      style: TextStyle(
                        color: Color(0xFF737379),
                        fontSize: 16,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return Wrap(
                          children: countries
                              .map((country) => CustomCountryChip(country))
                              .toList(),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if(state is DataSuccessfullyState){
                        Navigator.pushNamed(context, AppRoute.successRegisterScreen);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomElevatedButton(() {
                          cubit.userDataSetup();
                    }, "Next"),
                           SizedBox(height: 2.h,),
                           Visibility(
                              visible:state is DataLoadingState,
                              child: const Center(child: CircularProgressIndicator(strokeWidth:2,color: AppTheme.primary5,)))
                        ],
                      );}
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuBar(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 6.h,
          decoration: const BoxDecoration(
            color: AppTheme.neutral1,
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  onTap: () {
                    cubit.changeIndex(0);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                    alignment: Alignment.center,
                    decoration: (cubit.activeIndex == 0)
                        ? const BoxDecoration(
                            color: AppTheme.primary9,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                          )
                        : null,
                    child: Text(
                      "Work From Office",
                      style: (cubit.activeIndex == 0)
                          ? TextStyle(
                              color: Colors.white,
                              fontSize: 11.5.sp,
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w500,
                            )
                          : TextStyle(
                              color: AppTheme.neutral5,
                              fontSize: 11.5.sp,
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w500,
                            ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  onTap: () {
                    cubit.changeIndex(1);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                    alignment: Alignment.center,
                    decoration: (cubit.activeIndex == 1)
                        ? const BoxDecoration(
                            color: AppTheme.primary9,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                          )
                        : null,
                    child: Text(
                      "Remote Work",
                      style: (cubit.activeIndex == 1)
                          ? TextStyle(
                              color: Colors.white,
                              fontSize: 11.5.sp,
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w500,
                            )
                          : TextStyle(
                              color: AppTheme.neutral5,
                              fontSize: 11.5.sp,
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w500,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
