import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/business_logic/forget_password/forget_password_cubit.dart';
import 'package:jobsque/business_logic/layout_cubit.dart';
import 'package:jobsque/business_logic/login/login_cubit.dart';
import 'package:jobsque/business_logic/register/register_cubit.dart';
import 'package:jobsque/presentation/router/app_router.dart';
import 'package:jobsque/presentation/screens/Forgot_password/checkmail_password_screen.dart';
import 'package:jobsque/presentation/screens/Forgot_password/create_new_password.dart';
import 'package:jobsque/presentation/screens/Forgot_password/forgotpassword_screen.dart';
import 'package:jobsque/presentation/screens/Forgot_password/success_ForgotPassword_screen.dart';
import 'package:jobsque/presentation/screens/applied_job/applied_job.dart';
import 'package:jobsque/presentation/screens/apply_job/apply_job_screen.dart';
import 'package:jobsque/presentation/screens/apply_job/apply_successfully.dart';
import 'package:jobsque/presentation/screens/apply_job/bio_data_screen.dart';
import 'package:jobsque/presentation/screens/apply_job/job_details.dart';
import 'package:jobsque/presentation/screens/apply_job/type_of_work_screen.dart';
import 'package:jobsque/presentation/screens/apply_job/upload_portfolio.dart';
import 'package:jobsque/presentation/screens/create_account/location_register_screen.dart';
import 'package:jobsque/presentation/screens/create_account/register_screen.dart';
import 'package:jobsque/presentation/screens/create_account/success_register_screen.dart';
import 'package:jobsque/presentation/screens/create_account/work_register_screen.dart';
import 'package:jobsque/presentation/screens/home_screen.dart';
import 'package:jobsque/presentation/screens/layout/layout_app.dart';
import 'package:jobsque/presentation/screens/login_screen.dart';
import 'package:jobsque/presentation/screens/messsages_screen/message_empty_screen.dart';
import 'package:jobsque/presentation/screens/messsages_screen/messages_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/complete_profile_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/edit_details_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/education_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/experience_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/help_center_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/language_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/login_security_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/login_security_screens/change_password.dart';
import 'package:jobsque/presentation/screens/profile_screen/login_security_screens/email_address_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/login_security_screens/phone_number_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/login_security_screens/two_step_verification_1.dart';
import 'package:jobsque/presentation/screens/profile_screen/login_security_screens/two_step_verification_2.dart';
import 'package:jobsque/presentation/screens/profile_screen/login_security_screens/two_step_verification_3.dart';
import 'package:jobsque/presentation/screens/profile_screen/login_security_screens/two_step_verification_4.dart';
import 'package:jobsque/presentation/screens/profile_screen/portfolio_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/notification_settings_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/privacy_policy_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/terms_conditions_screen.dart';
import 'package:jobsque/presentation/screens/saved_job/saved_job_empty.dart';
import 'package:jobsque/presentation/screens/saved_job/saved_job_screen.dart';
import 'package:jobsque/presentation/screens/search_screen.dart';
import 'package:jobsque/presentation/screens/search_screen_not_found.dart';
import 'package:jobsque/presentation/screens/search_screen_result.dart';
import 'package:jobsque/presentation/screens/splash_screen.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/database/local_database/cache_helper.dart';
import 'business_logic/database/remoteDatabase/DioHelper.dart';
import 'core/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  CashHelper.init();
  DioHelper.init();
  runApp(
    // DevicePreview(
    //   //enabled: !kReleaseMode,
    //     tools: const [
    //       ...DevicePreview.defaultTools
    //     ],
    //     builder: (BuildContext context) => const MyApp() ,
    //     ),

     const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LayoutCubit>(
              create: (context) => LayoutCubit(),
            ),
            BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(),
            ),
            BlocProvider<ForgetPasswordCubit>(
              create: (context) => ForgetPasswordCubit(),
            ),
            BlocProvider<RegisterCubit>(
              create: (context) => RegisterCubit(),
            ),

          ],
          child: MaterialApp(
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            //  builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'SFProDisplay',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            //home: LayoutScreen(),
            onGenerateRoute: onGenerateRouter,

          ),
        );
      },

    );
  }
}



