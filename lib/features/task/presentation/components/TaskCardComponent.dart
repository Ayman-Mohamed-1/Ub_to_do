// import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:up_to_do/core/utils/app_colors.dart';
import 'package:up_to_do/core/utils/app_strings.dart';
import 'package:up_to_do/core/widget/custom_button.dart';
import 'package:up_to_do/features/task/data/model/taskModel.dart';

class TaskCardComponent extends StatelessWidget {
  TaskCardComponent({super.key, required this.taskModel});
  List<Color> arrColors = [
    AppColors.red,
    AppColors.green,
    AppColors.blueGrey,
    AppColors.blue,
    AppColors.orange,
    AppColors.purple,
    AppColors.grey,
  ];
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 20),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: AppColors.deepGrey,
            shape: Border.all(width: 0),
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 40.h,
                        child: customButton(
                          text: AppStrings.taskCompleted,
                          onPressed: () {},
                        ),
                      ),
                      Gap(25.h),
                      SizedBox(
                        width: double.infinity,
                        height: 40.h,
                        child: customButton(
                          text: AppStrings.deleteTask,
                          backgroundColor: AppColors.red,
                          onPressed: () {},
                        ),
                      ),
                      Gap(25.h),
                      SizedBox(
                        width: double.infinity,
                        height: 40.h,
                        child: customButton(
                          text: AppStrings.cancel,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Center(
          child: Container(
            padding: EdgeInsets.all(8),
            width: 427.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: arrColors[taskModel.color],
              border: Border.all(width: 1.w, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // text
                    Text(
                      taskModel.title,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),

                    // time
                    Row(
                      children: [
                        Icon(Icons.timer_outlined, color: AppColors.white),
                        Gap(3.w),
                        Text(
                          "${taskModel.startTime} - ${taskModel.endTime}",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),

                    // task text
                    Text(
                      taskModel.task,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                Spacer(),
                // ?devider
                Container(
                  margin: EdgeInsets.all(10),
                  width: 1.w,
                  height: 60.h,
                  color: AppColors.white,
                ),

                // todo text
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    taskModel.isComplete == true
                        ? AppStrings.completed
                        : AppStrings.toDo,
                    style: Theme.of(
                      context,
                    ).textTheme.displaySmall!.copyWith(fontSize: 14),
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
