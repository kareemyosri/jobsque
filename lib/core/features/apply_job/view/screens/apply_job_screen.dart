import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/features/apply_job/view/screens/bio_data_screen.dart';
import 'package:jobsque/core/features/apply_job/view/screens/type_of_work_screen.dart';
import 'package:jobsque/core/features/apply_job/view/screens/upload_portfolio.dart';
import 'package:jobsque/core/features/apply_job/view_model/job_cubit.dart';
import 'package:jobsque/core/features/home/model/job_model.dart';
import 'package:jobsque/util/constants.dart';
import 'package:jobsque/util/router/app_route.dart';

import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/ElvatedButton.dart';
import '../../../saved_job/model/favourite_model.dart';
import '../widgets/stepper_indicator.dart';

class ApplyJob extends StatefulWidget {
  final JobData jobData;
  const ApplyJob({super.key, required this.jobData});

  @override
  State<ApplyJob> createState() => _FormStepsState();
}

class _FormStepsState extends State<ApplyJob> {
  late PageController _pageController;
  late JobCubit cubit;

  @override
  void dispose() {
   // _pageController.dispose();
    usernameController.text='';
    emailController.text='';
    phoneController.text='';
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    cubit = JobCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if(cubit.currentStep == 0){
                cubit.currentStep = 0;
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.layoutScreen, (route) => false);
              }
              else{
                cubit.minusStep();
                _pageController.animateToPage(cubit.currentStep,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);

              }

            },
            icon: const Icon(Iconsax.arrow_left),
          ),
          title: Text('Apply Job',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SFProDisplay',
                  color: AppTheme.neutral9)),
          centerTitle: true,
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<JobCubit, JobState>(
                    builder: (context, state) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StepIndication(
                              1,
                              "Bio Data",
                              cubit.currentStep >= 0,
                            ),
                            StepIndication(
                              2,
                              'Type of work',
                              cubit.currentStep >= 1,
                            ),
                            StepIndication(
                                3, 'Upload portfolio', cubit.currentStep == 2,
                                lineState: false),
                          ]);
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1.2,
                  child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (int i) {
                        //FocusScope.of(context).requestFocus(FocusNode());

                        cubit.currentStep = i;
                      },
                      children: [
                        BioDataScreen(),
                        const TypeOfWorkScreen(),
                        const UploadPortfolio()
                      ]),
                ),
                SizedBox(
                  height: 3.h,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlocConsumer<JobCubit, JobState>(
                listener: (context, state){
                  if(state is ApplyJobSuccessState){
                    Navigator.pushNamed(context, AppRoute.applyJobSuccessfullyScreen);
                    cubit.currentStep = 0;
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(() {
                    if (cubit.currentStep < 2) {
                     if(formKey.currentState!.validate()){
                       cubit.addStep();

                       _pageController.animateToPage(cubit.currentStep,
                           duration: const Duration(milliseconds: 500),
                           curve: Curves.decelerate);
                     }
                    } else {

                      cubit.applyJob(usernameController.text, emailController.text, phoneController.text, widget.jobData.id.toString());
                    }
                  }, cubit.currentStep < 2 ? 'Next' : 'Submit');
                },
              ),
            ),
          ),
        ]));
  }
}
