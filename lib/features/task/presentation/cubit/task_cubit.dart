import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:up_to_do/core/database/sqflite/sqflite.dart';
import 'package:up_to_do/core/services/services_locator.dart';
import 'package:up_to_do/core/utils/app_colors.dart';
import 'package:up_to_do/features/task/data/model/taskModel.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  DateTime currentData = DateTime.now();
  DateTime selctedDate = DateTime.now();
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
  void insertData() async {
    emit(InsertTaskLoadingState());
    try {
      await sl<SqfliteHelper>().insert(
        TaskModel(
          date: DateFormat.yMd().format(currentData),
          title: titleController.text,
          task: noteController.text,
          endTime: endTime,
          startTime: startTime,
          isComplete: false,
          color: currentIndex,
        ),
      );
      noteController.clear();
      titleController.clear();
      print(tasksList);
      emit(InsertTaskSucessState());
      getTasks();
    } catch (e) {
      emit(InsertTaskErrorState());
    }
  }

  void getTasks() async {
    emit(GetTaskLoadingState());
    await sl<SqfliteHelper>()
        .getFromDB()
        .then((value) {
          tasksList = value
              .map((e) => TaskModel.fromMap(e))
              .toList()
              .where((e) => e.date == DateFormat.yMd().format(selctedDate))
              .toList();
          emit(GetTaskSucessState());
        })
        .catchError((e) {
          print(e.toString());
          emit(GetTaskErrorState());
        });
  }

  void deleteTask(id) async {
    emit(DeleteTaskLoadingState());
    await sl<SqfliteHelper>()
        .deleteDb(id)
        .then((value) {
          emit(DeleteTaskSucessState());
          getTasks();
        })
        .catchError((e) {
          print(e.toString());
          emit(DeleteTaskErrorState());
        });
  }

  void updataTask(id) async {
    emit(UpdataTaskLoadingState());
    await sl<SqfliteHelper>()
        .updateDb(id)
        .then((value) {
          emit(UpdateTaskSucessState());
          getTasks();
        })
        .catchError((e) {
          print(e.toString());
          emit(UpdateTaskErrorState());
        });
  }

  void getSelectDate(date) {
    emit(GetSelectDateLoadingState());
    selctedDate = date;
    emit(GetSelectDareTaskSucessState());
    getTasks();
  }

  //? end Cubit
}
