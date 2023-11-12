part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class AddItemCompleteProfile extends ProfileState {}
class AddItemCompleteProfileLoading extends ProfileState {}


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

// change language
class ChangeSelectedChoiceState extends ProfileState {}
// notification settings change
class ChangeSettingsItemeState extends ProfileState {}
// change password suffix icon
class ChangeIconState extends ProfileState {}
// change password error color
class ChangeColorIndexState extends ProfileState {}
class ChangeSecondColorIndexState extends ProfileState {}
class ChangeThirdColorIndexState extends ProfileState {}


class AddCVLoadingState extends ProfileState {}
class AddCVErrorState extends ProfileState {}
class AddCVSuccessState extends ProfileState {}
//pick portofolio
class PickCVLoading extends ProfileState {}
class PickCVError extends ProfileState {}
class PickCVSuccess extends ProfileState {}

//pick profile image
class PickImageLoading extends ProfileState {}
class PickImageError extends ProfileState {}
class PickImageSuccess extends ProfileState {}
class OldImageDeleted extends ProfileState {}

class GetImageLoading extends ProfileState {}
class GetImageError extends ProfileState {}
class GetImageSuccess extends ProfileState {}

class AddExperienceLoadingState extends ProfileState {}
class AddExperienceErrorState extends ProfileState {}
class AddExperienceSuccessState extends ProfileState {}

//Experience check box
class ChangeCheckExperienceState extends ProfileState {}
