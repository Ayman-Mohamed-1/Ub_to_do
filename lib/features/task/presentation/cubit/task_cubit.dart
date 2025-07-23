import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:up_to_do/core/utils/app_colors.dart';
import 'package:up_to_do/features/task/data/model/taskModel.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  GlobalKey<FormState> formkwy = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  DateTime currentData = DateTime.now();
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat(
    "hh:mm a",
  ).format(DateTime.now().add(Duration(minutes: 45)));

  List<Color> arrColors = [
    AppColors.red,
    AppColors.green,
    AppColors.blueGrey,
    AppColors.blue,
    AppColors.orange,
    AppColors.purple,
    AppColors.grey,
  ];
  int currentIndex = 0;

  //! pickedData Fn
  void getdata(context) async {
    emit(GetDateLoadingState());
    DateTime? pickedData = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedData != null) {
      currentData = pickedData;
      emit(GetDateSucessState());
    } else {
      currentData;
      emit(GetDateErrorState());
    }
  }

  //* pickedData Fn
  //! Start time
  void startTimeFn(context) async {
    emit(StartTimeLoadingState());
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      emit(StartTimeSucessState());
    } else {
      startTime;
      emit(StartTimeErrorState());
    }
  }

  //* Start time
  //! end time
  void endTimeFn(context) async {
    emit(EndtTimeLoadingState());
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(EndTimeSucessState());
    } else {
      endTime;
      emit(EndTimeErrorState());
    }
  }

  //* end time
  //! ChangeCheckMarkIndextime
  changeCheckMarkIndex(index) {
    currentIndex = index;
    emit(ChangeCheckMarkIndexState());
  }

  //*  ChangeCheckMarkIndex time
  List<TaskModel> tasksList = [];
  void insertData() {
    emit(InsertTaskLoadingState());
    try {
      tasksList.add(
        TaskModel(
          id: 1,
          title: titleController.text,
          task: noteController.text,
          endTime: endTime,
          startTime: startTime,
          color: currentIndex,
          isComplete: true,
        ),
      );
      print(tasksList);
      emit(InsertTaskSucessState());
    } catch (e) {
      emit(InsertTaskErrorState());
    }
  }

  //? end Cubit
}
