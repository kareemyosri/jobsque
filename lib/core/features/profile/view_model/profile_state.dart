part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileLoading extends ProfileState {}
class GetProfileError extends ProfileState {}
class GetProfileSuccessfully extends ProfileState {}

class UpdateProfileLoading extends ProfileState {}
class UpdateProfileError extends ProfileState {}
class UpdateProfileSuccessfully extends ProfileState {

}


class GetPortfolioLoading extends ProfileState {}
class GetPortfolioError extends ProfileState {}
class GetPortfolioSuccessfully extends ProfileState {}



class UpdateProfileDetailsLoading extends ProfileState {}
class UpdateProfileDetailsError extends ProfileState {}
class UpdateProfileDetailsSuccessfully extends ProfileState {}


