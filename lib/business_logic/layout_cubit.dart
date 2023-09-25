import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/presentation/screens/apply_job/apply_job_screen.dart';
import 'package:jobsque/presentation/screens/home_screen.dart';
import 'package:jobsque/presentation/screens/messsages_screen/messages_screen.dart';
import 'package:jobsque/presentation/screens/profile_screen/profile_screen.dart';
import 'package:jobsque/presentation/screens/saved_job/saved_job_screen.dart';
import 'package:meta/meta.dart';

import '../presentation/screens/applied_job/applied_job.dart';
import '../presentation/screens/saved_job/saved_job_empty.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> screens =  [
    HomeScreen(),
    MessagesScreen(),
    AppliedJobScreen(),
    SavedJobScreen(), //SavedJobEmptyScreen
    ProfileScreen(),
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
