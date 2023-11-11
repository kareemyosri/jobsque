
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/database/local_database/cache_helper.dart';
import 'package:jobsque/core/enums.dart';

import '../../../../../core/animations/scale_transition_animation.dart';
import '../../../../../core/router/app_route.dart';
import '../../../../../core/widgets/home_indicator.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer (const Duration(milliseconds: 1300),
        (){
      final token=CashHelper.getString(key: MySharedKeys.token);
      final onBoarding=CashHelper.getString(key: MySharedKeys.onboarding);
      final rememberMe=CashHelper.getString(key: MySharedKeys.rememberMe);


      if(token!.isNotEmpty && rememberMe=='true'){
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.layoutScreen, (route) => false);

          }
          else if(token!.isNotEmpty && rememberMe=='false'){
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
          }
          else if(token!.isEmpty && onBoarding=='true'){
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
          }
          else{
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.onBoardingScreen, (route) => false);

          }
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children:[
          Expanded(
            child: Stack(
            alignment: Alignment.center,
              children: [
                SvgPicture.asset("assets/images/splash/Blur.svg"),
                ScaleTransitionAnimation(duration: const Duration(seconds: 1), child: SvgPicture.asset("assets/images/splash/Logo (1).svg"),),
              ],
            ),
          ),
      ],
      ),
    );
  }
}
