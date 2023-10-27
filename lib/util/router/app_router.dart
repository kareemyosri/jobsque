
import 'package:flutter/material.dart';
import 'package:jobsque/util/router/app_route.dart';

import '../../core/features/create_account/view/screens/location_register_screen.dart';
import '../../core/features/create_account/view/screens/register_screen.dart';
import '../../core/features/create_account/view/screens/success_register_screen.dart';
import '../../core/features/create_account/view/screens/work_register_screen.dart';
import '../../core/features/forgot_password/view/screens/checkmail_password_screen.dart';
import '../../core/features/forgot_password/view/screens/create_new_password.dart';
import '../../core/features/forgot_password/view/screens/forgotpassword_screen.dart';
import '../../core/features/forgot_password/view/screens/success_ForgotPassword_screen.dart';
import '../../core/features/home/screens/home_screen.dart';
import '../../core/features/home_layout/view/screens/layout_app.dart';
import '../../core/features/login/view/screens/login_screen.dart';
import '../../core/features/onboarding/view/screens/onboarding_screen.dart';
import '../../core/features/splash/view/screens/splash_screen.dart';

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