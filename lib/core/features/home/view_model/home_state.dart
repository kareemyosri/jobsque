part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllRecentJobsSuccessfully extends HomeState {}
class GetAllRecentJobsLoading extends HomeState {}
class GetAllRecentJobsError extends HomeState {}

class GetAllSuggestJobsSuccessfully extends HomeState {}
class GetAllSuggestJobsLoading extends HomeState {}
class GetAllSuggestJobsError extends HomeState {}

class GetFavouriteJobsSuccessfully extends HomeState {}
class GetFavouriteJobsLoading extends HomeState {}
class GetFavouriteJobsError extends HomeState {}

class AddFavouriteJobsSuccessfully extends HomeState {}
class AddFavouriteJobsLoading extends HomeState {}
class AddFavouriteJobsError extends HomeState {}

class RemoveFavouriteItemLoadingState extends HomeState {}
class RemoveFavouriteItemSuccessfullyState extends HomeState {}
class RemoveFavouriteItemErrorState extends HomeState {}

