
import 'package:flutter/material.dart';
import 'package:jobsque/presentation/router/app_route.dart';
import 'package:jobsque/presentation/screens/Forgot_password/forgotpassword_screen.dart';
import 'package:jobsque/presentation/screens/create_account/location_register_screen.dart';
import 'package:jobsque/presentation/screens/create_account/register_screen.dart';
import 'package:jobsque/presentation/screens/create_account/work_register_screen.dart';
import 'package:jobsque/presentation/screens/layout/layout_app.dart';
import 'package:jobsque/presentation/screens/login_screen.dart';
import 'package:jobsque/presentation/screens/splash_screen.dart';

import '../screens/Forgot_password/checkmail_password_screen.dart';
import '../screens/Forgot_password/create_new_password.dart';
import '../screens/Forgot_password/success_ForgotPassword_screen.dart';
import '../screens/create_account/success_register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/onboarding_screen.dart';

Route? onGenerateRouter(RouteSettings settings){
  switch(settings.name){
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_)=> const SplashScreen());
    case AppRoute.onBoardingScreen:
      return MaterialPageRoute(builder: (_)=>  const OnboardingScreen());

    case AppRoute.loginScreen:
      return MaterialPageRoute(builder: (_)=>  const LoginScreen());

    case AppRoute.forgetPasswordScreen  :
      return MaterialPageRoute(builder: (_)=>  const ForgotPasswordScreen());
    case AppRoute.checkEmailForgetPasswordScreen  :
      return MaterialPageRoute(builder: (_)=>  const CheckMailForgotPasswordScreen());
    case AppRoute.createNewPasswordScreen  :
      return MaterialPageRoute(builder: (_)=>   const CreateNewPassword());
    case AppRoute.successForgetPasswordScreen  :
      return MaterialPageRoute(builder: (_)=>   const SuccessForgotPasswordScreen());

    case AppRoute.registerScreen:
      return MaterialPageRoute(builder: (_)=>  const RegisterScreen());
    case AppRoute.registerWorkScreen:
      return MaterialPageRoute(builder: (_)=>  const RegisterWorkScreen());
    case AppRoute.locationRegisterScreen:
      return MaterialPageRoute(builder: (_)=>  const LocationRegisterScreen());
    case AppRoute.successRegisterScreen:
      return MaterialPageRoute(builder: (_)=>  const SuccessRegisterScreen());

    case AppRoute.layoutScreen:
      return MaterialPageRoute(builder: (_)=>  const LayoutScreen());
    case AppRoute.homeScreen:
      return MaterialPageRoute(builder: (_)=>  HomeScreen());
    // case AppRoute.registerScreen:
    //   return MaterialPageRoute(builder: (_)=>  RegisterScreenTask());
    // case AppRoute.loginScreen:
    //   return MaterialPageRoute(builder: (_)=>  LoginScreenTask());

    default:
      return null;

  }

}