part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {}

final class SearchEmpty extends SearchState {}

final class SearchError extends SearchState {}

final class FilterLoading extends SearchState {}

final class FilterSuccess extends SearchState {}

final class FilterError extends SearchState {}
final class ChangeSalaryFilter extends SearchState {}
final class ChangeJobTypeColor extends SearchState {}
