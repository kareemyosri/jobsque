

import 'package:flutter/material.dart';
import 'package:jobsque/core/features/apply_job/view/screens/apply_job_screen.dart';
import 'package:jobsque/core/features/apply_job/view/screens/apply_successfully.dart';
import 'package:jobsque/core/features/profile/view/screen/language_screen.dart';
import 'package:jobsque/core/features/profile/view/screen/login_security_screens/change_password.dart';
import 'package:jobsque/core/features/profile/view/screen/login_security_screens/phone_number_screen.dart';
import 'package:jobsque/core/features/profile/view/screen/login_security_screens/two_step_verification_1.dart';
import 'package:jobsque/core/features/profile/view/screen/login_security_screens/two_step_verification_2.dart';
import 'package:jobsque/core/features/profile/view/screen/login_security_screens/two_step_verification_3.dart';
import 'package:jobsque/core/features/profile/view/screen/login_security_screens/two_step_verification_4.dart';
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
import '../../core/features/notification/view/notification_screen.dart';
import '../../core/features/onboarding/view/screens/onboarding_screen.dart';
import '../../core/features/profile/model/pdf_args.dart';
import '../../core/features/profile/view/screen/edit_details_screen.dart';
import '../../core/features/profile/view/screen/help_center_screen.dart';
import '../../core/features/profile/view/screen/login_security_screen.dart';
import '../../core/features/profile/view/screen/login_security_screens/email_address_screen.dart';
import '../../core/features/profile/view/screen/notification_settings_screen.dart';
import '../../core/features/profile/view/screen/portfolio_screen.dart';
import '../../core/features/profile/view/screen/privacy_policy_screen.dart';
import '../../core/features/profile/view/screen/terms_conditions_screen.dart';
import '../../core/features/saved_job/model/favourite_model.dart';
import '../../core/features/splash/view/screens/splash_screen.dart';
import '../animations/page_slide_transition.dart';

Route? onGenerateRouter(RouteSettings settings){
  switch(settings.name){
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_)=> const SplashScreen());
    case AppRoute.onBoardingScreen:
      return PageSlideTransition(direction: AxisDirection.left, page: const OnboardingScreen());

    case AppRoute.loginScreen:
      return PageSlideTransition(direction: AxisDirection.left, page: const LoginScreen());


    case AppRoute.forgetPasswordScreen  :
      return PageSlideTransition(direction: AxisDirection.left, page: const ForgotPasswordScreen());

    case AppRoute.checkEmailForgetPasswordScreen  :
      return PageSlideTransition(direction: AxisDirection.left, page: const CheckMailForgotPasswordScreen());

    case AppRoute.createNewPasswordScreen  :
      return PageSlideTransition(direction: AxisDirection.left, page: const CreateNewPassword());

    case AppRoute.successForgetPasswordScreen  :
      return PageSlideTransition(direction: AxisDirection.left, page: const SuccessForgotPasswordScreen());


    case AppRoute.registerScreen:
      return PageSlideTransition(direction: AxisDirection.left, page: const RegisterScreen());

    case AppRoute.registerWorkScreen:
      return PageSlideTransition(direction: AxisDirection.left, page: const RegisterWorkScreen());

    case AppRoute.locationRegisterScreen:
      return PageSlideTransition(direction: AxisDirection.left, page: const LocationRegisterScreen());

    case AppRoute.successRegisterScreen:
      return PageSlideTransition(direction: AxisDirection.left, page: const SuccessRegisterScreen());


    case AppRoute.layoutScreen:
      return MaterialPageRoute(builder: (_)=>const LayoutScreen());
      //return PageSlideTransition(direction: AxisDirection.left, page: const LayoutScreen());

    case AppRoute.homeScreen:
      return PageSlideTransition(direction: AxisDirection.left, page:  HomeScreen());
    case AppRoute.notificationScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:  const NotificationScreen());

    case AppRoute.jobDetailsScreen:
      final args = settings.arguments as JobData;
      return PageSlideTransition(direction: AxisDirection.right, page:  JobDetails(jobData: args,));

    case AppRoute.applyJobScreen:
      final args = settings.arguments as JobData;
      return PageSlideTransition(direction: AxisDirection.right, page:  ApplyJob(jobData: args,));

    case AppRoute.applyJobSuccessfullyScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:const  ApplyJobSuccessfully());

    case AppRoute.pdfScreen:
      final args = settings.arguments as PdfScreenArguments;

      return PageSlideTransition(direction: AxisDirection.left, page:  PDFScreen(text: args.text, selectedCV: args.file,));

    case AppRoute.imageScreen:
      return PageSlideTransition(direction: AxisDirection.left, page:  ImageScreen());

    case AppRoute.searchScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:  SearchScreen());



    case AppRoute.editDetailsScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:  EditDetalisScreen());

    case AppRoute.portfolioScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:  const PortfolioScreen());

    case AppRoute.languageScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:  const LanguageScreen());

    case AppRoute.notificationsSettingsScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:  const NotificationsSettingsScreen());

    case AppRoute.privacyAndPolicyScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:  const PrivacyAndPolicyScreen());

    case AppRoute.helpCenterScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:   HelpCenterScreen());

    case AppRoute.termsAndConditionsScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:   const TermsAndConditionsScreen());

    case AppRoute.loginAndSecurityScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:   const LoginAndSecurityScreen());

    case AppRoute.emailAddressScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:   EmailAddressScreen());

    case AppRoute.phoneNumberScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:   PhoneNumberScreen());

    case AppRoute.changePasswordScreen:
      return PageSlideTransition(direction: AxisDirection.right, page:   ChangePasswordScreen());

    case AppRoute.twoStepVerification1:
      return PageSlideTransition(direction: AxisDirection.right, page:   TwoStepVerification1());

    case AppRoute.twoStepVerification2:
      return PageSlideTransition(direction: AxisDirection.right, page:   TwoStepVerification2());

    case AppRoute.twoStepVerification3:
      return PageSlideTransition(direction: AxisDirection.right, page:   TwoStepVerification3());

    case AppRoute.twoStepVerification4:
      return PageSlideTransition(direction: AxisDirection.right, page:   TwoStepVerification4());

    default:
      return null;

  }

}