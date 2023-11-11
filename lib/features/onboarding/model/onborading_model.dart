import 'package:flutter/material.dart';
import 'package:jobsque/core/styles/color.dart';
import 'package:sizer/sizer.dart';

class OnboardingModel {
  String image;
  Text title;
  String body;

  OnboardingModel(this.image, this.title, this.body);

  static List<OnboardingModel> boardingData=[
    OnboardingModel("assets/images/onboarding/Background.svg"  ,
  Text.rich(
  TextSpan(
  children: [
  TextSpan(text: "Find a job, and ", style:TextStyle(
    fontSize: 27.sp,
    fontWeight: FontWeight.w500,
    fontFamily:'SFProDisplay',
    color: AppTheme.neutral9,
  )),
  TextSpan(text: "start building ", style: TextStyle(
    fontSize: 27.sp,
    fontWeight: FontWeight.w500,
    fontFamily:'SFProDisplay',
    color: AppTheme.primary5,
  )),
    TextSpan(text: " your career from now on", style:TextStyle(
      fontSize: 27.sp,
      fontWeight: FontWeight.w500,
      fontFamily:'SFProDisplay',
      color: AppTheme.neutral9,
    )),
  ],
  ),
  ),

        "Explore over 25,924 available job roles and upgrade your operator now."),
    OnboardingModel("assets/images/onboarding/background-3.svg",
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Hundreds of jobs are waiting for you to  ", style:TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeight.w500,
                fontFamily:'SFProDisplay',
                color: AppTheme.neutral9,
              )),
              TextSpan(text: "join together ", style: TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeight.w500,
                fontFamily:'SFProDisplay',
                color: AppTheme.primary5,
              )),
            ],
          ),
        ),


        "Immediately join us and start applying for the job you are interested in."),

    OnboardingModel("assets/images/onboarding/background-4.svg",
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Get the best ", style:TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeight.w500,
                fontFamily:'SFProDisplay',
                color: AppTheme.neutral9,
              )),
              TextSpan(text: "choice for the job ", style: TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeight.w500,
                fontFamily:'SFProDisplay',
                color: AppTheme.primary5,
              )),
              TextSpan(text: "you've always dreamed of", style:TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeight.w500,
                fontFamily:'SFProDisplay',
                color: AppTheme.neutral9,
              )),
            ],
          ),
        ),

        "The better the skills you have, the greater the good job opportunities for you."),

  ];
}