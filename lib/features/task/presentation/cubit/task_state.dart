part of 'task_cubit.dart';

sealed class TaskState {}

//! pickedData Fn
final class TaskInitial extends TaskState {}

final class GetDateLoadingState extends TaskState {}

final class GetDateSucessState extends TaskState {}

final class GetDateErrorState extends TaskState {}

//* pickedData Fn
//! Start time
final class StartTimeLoadingState extends TaskState {}

final class StartTimeSucessState extends TaskState {}

final class StartTimeErrorState extends TaskState {}

//* Start time
//! Start time
final class EndtTimeLoadingState extends TaskState {}

final class EndTimeSucessState extends TaskState {}

final class EndTimeErrorState extends TaskState {}

//* Start time
//! ChangeCheckMarkIndextime
final class ChangeCheckMarkIndexState extends TaskState {}

//*  ChangeCheckMarkIndex time
//! Start time
final class InsertTaskLoadingState extends TaskState {}

final class InsertTaskSucessState extends TaskState {}

final class InsertTaskErrorState extends TaskState {}

//* Start time
