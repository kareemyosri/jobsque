import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/features/apply_job/view_model/job_cubit.dart';
import 'package:jobsque/core/features/home/view/screens/home_screen.dart';
import 'package:jobsque/core/features/home/view_model/home_cubit.dart';
import 'package:jobsque/core/features/saved_job/view_model/favourite_cubit.dart';
import 'package:jobsque/util/bloc_observer.dart';
import 'package:jobsque/util/database/local_database/cache_helper.dart';
import 'package:jobsque/util/database/remoteDatabase/DioHelper.dart';
import 'package:jobsque/util/router/app_router.dart';

import 'package:sizer/sizer.dart';

import 'core/features/create_account/view_model/register_cubit.dart';
import 'core/features/forgot_password/view_model/forget_password_cubit.dart';
import 'core/features/home_layout/view_model/layout_cubit.dart';
import 'core/features/login/view_model/login_cubit.dart';



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
            BlocProvider(
              create: (context) => HomeCubit()
                ..getAllRecentJobs()..getAllSuggestJobs()..getFavouriteJobs(),
            ),
            BlocProvider(
              create: (context) => JobCubit(),
            ),
            BlocProvider(
              create: (context) => FavouriteCubit(),
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



