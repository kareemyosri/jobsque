
import 'package:flutter/material.dart';
import 'package:jobsque/core/features/apply_job/view/screens/apply_job_screen.dart';
import 'package:jobsque/core/features/apply_job/view/screens/apply_successfully.dart';
import 'package:jobsque/core/features/home/model/job_model.dart';
import 'package:jobsque/core/features/profile/view/screen/language_screen.dart';
import 'package:jobsque/core/features/search/view/screens/search_screen.dart';
import 'package:jobsque/util/router/app_route.dart';

import '../../core/features/apply_job/view/screens/job_details.dart';
import '../../core/features/apply_job/view/widgets/image_screen.dart';
import '../../core/features/apply_job/view/widgets/pdf_screen.dart';
import '../../core/features/create_account/view/screens/location_register_screen.dart';
import '../../core/features/create_account/view/screens/register_screen.dart';
import '../../core/features/create_account/view/screens/success_register_screen.dart';
import '../../core/features/create_account/view/screens/work_register_screen.dart';
import '../../core/features/forgot_password/view/screens/checkmail_password_screen.dart';
import '../../core/features/forgot_password/view/screens/create_new_password.dart';
import '../../core/features/forgot_password/view/screens/forgotpassword_screen.dart';
import '../../core/features/forgot_password/view/screens/success_ForgotPassword_screen.dart';
import '../../core/features/home/view/screens/home_screen.dart';
import '../../core/features/home_layout/view/screens/layout_app.dart';
import '../../core/features/login/view/screens/login_screen.dart';
import '../../core/features/onboarding/view/screens/onboarding_screen.dart';
import '../../core/features/profile/view/screen/edit_details_screen.dart';
import '../../core/features/profile/view/screen/help_center_screen.dart';
import '../../core/features/profile/view/screen/login_security_screen.dart';
import '../../core/features/profile/view/screen/notification_settings_screen.dart';
import '../../core/features/profile/view/screen/portfolio_screen.dart';
import '../../core/features/profile/view/screen/privacy_policy_screen.dart';
import '../../core/features/profile/view/screen/terms_conditions_screen.dart';
import '../../core/features/saved_job/model/favourite_model.dart';
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
    case AppRoute.jobDetailsScreen:
      final args = settings.arguments as JobData;
      return MaterialPageRoute(builder: (_)=>  JobDetails(jobData: args,));
    case AppRoute.applyJobScreen:
      final args = settings.arguments as JobData;
      return MaterialPageRoute(builder: (_)=>  ApplyJob(jobData: args,));
    case AppRoute.applyJobSuccessfullyScreen:
      return MaterialPageRoute(builder: (_)=>  const ApplyJobSuccessfully());
    case AppRoute.pdfScreen:
      return MaterialPageRoute(builder: (_)=>   PDFScreen());
    case AppRoute.imageScreen:
      return MaterialPageRoute(builder: (_)=>   const ImageScreen());
    case AppRoute.searchScreen:
      return MaterialPageRoute(builder: (_)=>    SearchScreen());


    case AppRoute.editDetailsScreen:
      return MaterialPageRoute(builder: (_)=>    EditDetalisScreen());
    case AppRoute.portfolioScreen:
      return MaterialPageRoute(builder: (_)=>    const PortfolioScreen());
    case AppRoute.languageScreen:
      return MaterialPageRoute(builder: (_)=>    const LanguageScreen());
    case AppRoute.notificationsSettingsScreen:
      return MaterialPageRoute(builder: (_)=>    const NotificationsSettingsScreen());
    case AppRoute.privacyAndPolicyScreen:
      return MaterialPageRoute(builder: (_)=>    const PrivacyAndPolicyScreen());
    case AppRoute.helpCenterScreen:
      return MaterialPageRoute(builder: (_)=>     HelpCenterScreen());
    case AppRoute.termsAndConditionsScreen:
      return MaterialPageRoute(builder: (_)=>     const TermsAndConditionsScreen());
    case AppRoute.loginAndSecurityScreen:
      return MaterialPageRoute(builder: (_)=>     const LoginAndSecurityScreen());
    default:
      return null;

  }

}