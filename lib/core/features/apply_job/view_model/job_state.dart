part of 'job_cubit.dart';

@immutable
abstract class JobState {}

class JobInitial extends JobState {}

class ChangeIndexState extends JobState {}

