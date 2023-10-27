
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/router/app_route.dart';
import '../../../../../util/widgets/home_indicator.dart';


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
    Timer (const Duration(seconds: 3),
        (){

          Navigator.pushNamedAndRemoveUntil(context, AppRoute.onBoardingScreen, (route) => false);
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
                SvgPicture.asset("assets/images/splash/Logo (1).svg"),
              ],
            ),
          ),
      ],
      ),
    );
  }
}