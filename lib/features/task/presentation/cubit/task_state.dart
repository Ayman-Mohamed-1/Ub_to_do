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
//! Inser data
final class InsertTaskLoadingState extends TaskState {}

final class InsertTaskSucessState extends TaskState {}

final class InsertTaskErrorState extends TaskState {}

//* Inser data
//! get data
final class GetTaskLoadingState extends TaskState {}

final class GetTaskSucessState extends TaskState {}

final class GetTaskErrorState extends TaskState {}

//* get data
//! updae data
final class UpdataTaskLoadingState extends TaskState {}

final class UpdateTaskSucessState extends TaskState {}

final class UpdateTaskErrorState extends TaskState {}

//* get data
//! get data
final class DeleteTaskLoadingState extends TaskState {}

final class DeleteTaskSucessState extends TaskState {}

final class DeleteTaskErrorState extends TaskState {}

//* get data
//!get Select Date
final class GetSelectDateLoadingState extends TaskState {}

final class GetSelectDareTaskSucessState extends TaskState {}

//*get Select Date
