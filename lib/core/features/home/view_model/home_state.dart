part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllRecentJobsSuccessfully extends HomeState {}
class GetAllRecentJobsLoading extends HomeState {}
class GetAllRecentJobsError extends HomeState {}
