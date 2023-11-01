part of 'job_cubit.dart';

@immutable
abstract class JobState {}

class JobInitial extends JobState {}

class ChangeIndexState extends JobState {}
class ChangeAddStepState extends JobState {}
class ChangeMinusStepState extends JobState {}

class ChangeSelectedChoiceState extends JobState {}

class ApplyJobLoadingState extends JobState {}
class ApplyJobErrorState extends JobState {}
class ApplyJobSuccessState extends JobState {}

class PickCVLoading extends JobState {}
class PickCVError extends JobState {}
class PickCVSuccess extends JobState {}
