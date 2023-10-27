part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterErrorState extends RegisterState {}

class ChangeIconState extends RegisterState {}
class ChangeTappedState extends RegisterState {}

class InterestedWorkState extends RegisterState {}



class DataSuccessfullyState extends RegisterState {}
class DataErrorState extends RegisterState {}
class DataLoadingState extends RegisterState {}

class SelectCountryState extends RegisterState {}

class ChangeIndexState extends RegisterState {}


class ChangeColorIndexState extends RegisterState {}
