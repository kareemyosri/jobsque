import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../util/router/app_route.dart';
import '../../../../../util/widgets/ElvatedButton.dart';
import '../../model/onborading_model.dart';
import '../widgets/onboardingItem.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool show= false;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding:EdgeInsets.only(left: 2.h),
          child: SvgPicture.asset("assets/images/auth/Logo (1).svg"),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: TextButton(onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
            }, child: const Text("Skip")),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemBuilder: (context, index) {

                  return BoardingItem(model: OnboardingModel.boardingData[index]);


      },
              itemCount: OnboardingModel.boardingData.length,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                if (index==2){
                  setState(() {
                    show=true;
                  });
                }
                 else {
                  setState(() {
                    show = false;
                  });
                }
              },
            ),
          ),
          SmoothPageIndicator(
              controller: controller,  // PageController
              count:  3,
              effect:  const SwapEffect(
                  type: SwapType.yRotation,
                dotWidth: 8,
                dotHeight: 8,

              ),  // your preferred effect
              onDotClicked: (index){

              }
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 6, 24, 24),
            child: CustomElevatedButton(() {
              if(show){
                //CashHelper.putBool(key: MySharedKeys.onboarding, value: true);
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);

              }
              else{
                controller.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);

              }

            },

                show?  "Get Started" : "Next"

            ),
          ),
        ],
      ),
    );
  }
}
