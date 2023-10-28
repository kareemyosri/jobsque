import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

import '../../applied_job/view/screens/applied_job.dart';
import '../../home/view/screens/home_screen.dart';
import '../../messsages_screen/screens/messages_screen.dart';
import '../../profile/view/screen/profile_screen.dart';
import '../../saved_job/screens/saved_job_screen.dart';



part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens =  [
    HomeScreen(),
    MessagesScreen(),
    const AppliedJobScreen(),
    const SavedJobScreen(), //SavedJobEmptyScreen
    const ProfileScreen(),
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
