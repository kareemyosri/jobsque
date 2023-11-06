import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context)=> BlocProvider.of(context);
  final controller = PageController();
  bool show= false;
  void changePageView(int index) {
    if (index == 2) {
      show = true;
      emit(ChangePageViewState());
    } else {
      show = false;
      emit(ChangePageViewState());
    }
  }

}
