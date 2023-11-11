import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/util/database/local_database/cache_helper.dart';
import 'package:jobsque/util/enums.dart';

import 'package:meta/meta.dart';

import '../../applied_job/view/screens/applied_job.dart';
import '../../home/view/screens/home_screen.dart';
import '../../messsages_screen/view/screens/messages_screen.dart';
import '../../profile/view/screen/complete_profile_screen.dart';
import '../../profile/view/screen/profile_screen.dart';
import '../../saved_job/view/screens/saved_job_screen.dart';



part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  void getCompleteProfile(){

    if (CashHelper.getString(key: MySharedKeys.completeProfile) == 'true') {
      screens[4] = const ProfileScreen();
    } else {
      screens[4] = const CompleteProfileScreen();
    }

  }
  List<Widget> screens =  [

    HomeScreen(),
    MessagesScreen(),
    const AppliedJobScreen(),
    const SavedJobScreen(), //SavedJobEmptyScreen

  const CompleteProfileScreen(),
  ];


  List<String> titles = [
    'Home',
    'Messages',
    'Applied',
    'Saved',
    'Profile'
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNacBarState());
  }
}
