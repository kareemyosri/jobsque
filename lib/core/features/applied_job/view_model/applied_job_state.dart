part of 'applied_job_cubit.dart';

@immutable
abstract class AppliedJobState {}

class AppliedJobInitial extends AppliedJobState {}

class ChangeIndex extends AppliedJobState {}

class GetAppliedJobsLoading extends AppliedJobState {}
class AppliedJobEmpty extends AppliedJobState {}
class GetAppliedJobsSuccessfully extends AppliedJobState {}
class GetAppliedJobsError extends AppliedJobState {}

class GetAppliedJobsIDLoading extends AppliedJobState {}
class GetAppliedJobsIDSuccessfully extends AppliedJobState {}
class GetAppliedJobsIDError extends AppliedJobState {}