import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/router/app_route.dart';
import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/ElvatedButton.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../model/country_model.dart';
import '../widgets/country.dart';
import '../../view_model/register_cubit.dart';
import '../widgets/select_type_job.dart';

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
                    const SelectTypeJobMenu(),
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
                        showSuccessSnackBar(context: context, message: 'User Data setup Successfully');

                        //hint: cache data registered to true
                        Navigator.pushNamed(context, AppRoute.successRegisterScreen);
                      }
                      else if(state is DataErrorState){
                        showErrorSnackBar(context: context, message: 'There is something went wrong.Try Again');

                      }
                    },
                    builder: (context, state) {

                        return BuildCondition(
                          condition: state is! DataLoadingState,
                          builder: (context)=>CustomElevatedButton(() {
                            cubit.userDataSetup();
                          }, "Next"),
                          fallback:(context)=> const Center(child: CircularProgressIndicator(strokeWidth:2,color: AppTheme.primary5,)),
                        );



                    }
                  )),
            ],
          ),
        ),
      ),
    );
  }

}
