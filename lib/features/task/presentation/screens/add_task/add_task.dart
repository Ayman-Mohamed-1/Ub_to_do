import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:up_to_do/core/utils/app_colors.dart';
import 'package:up_to_do/core/utils/app_strings.dart';
import 'package:up_to_do/core/widget/custom_button.dart';
import 'package:up_to_do/features/task/presentation/components/AddTaskComponents.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
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
  DateTime currentData = DateTime.now();

  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat(
    "hh:mm a",
  ).format(DateTime.now().add(Duration(minutes: 45)));

  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
        ),
        title: Text(
          AppStrings.addTask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(30.h),
                AddTaskComponents(
                  controller: title,
                  tilte: AppStrings.tilte,
                  hintText: AppStrings.tilteHint,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return AppStrings.tilteErrorMsg;
                    } else {
                      return null;
                    }
                  },
                ),
                AddTaskComponents(
                  controller: note,
                  tilte: AppStrings.note,
                  hintText: AppStrings.notehint,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return AppStrings.noteErrorMsg;
                    } else {
                      return null;
                    }
                  },
                ),
                AddTaskComponents(
                  readOnly: true,
                  tilte: AppStrings.date,
                  hintText: DateFormat.yMd().format(currentData),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? pickedData = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      setState(() {
                        if (pickedData != null) {
                          currentData = pickedData;
                        } else {
                          currentData;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.calendar_month_rounded,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AddTaskComponents(
                        tilte: AppStrings.startTime,
                        hintText: startTime,
                        readOnly: true,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            TimeOfDay? pickedStartTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                DateTime.now(),
                              ),
                            );
                            setState(() {
                              if (pickedStartTime != null) {
                                startTime = pickedStartTime.format(context);
                              } else {
                                startTime;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.timer_outlined,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    Gap(27.h),
                    Expanded(
                      child: AddTaskComponents(
                        tilte: AppStrings.endTime,
                        hintText: endTime,
                        readOnly: true,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            TimeOfDay? pickedEndTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                DateTime.now(),
                              ),
                            );
                            setState(() {
                              if (pickedEndTime != null) {
                                endTime = pickedEndTime.format(context);
                              } else {
                                endTime;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.timer_outlined,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  AppStrings.color,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Gap(10.h),
                Row(
                  children: List.generate(arrColors.length, (index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                              print(index);
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: arrColors[index],
                            child: index == currentIndex
                                ? Icon(Icons.check, color: AppColors.white)
                                : null,
                          ),
                        ),
                        Gap(8.w),
                      ],
                    );
                  }),
                ),
                Gap(160.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: customButton(
                    text: AppStrings.createTask,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
