import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:up_to_do/core/utils/app_colors.dart';
import 'package:up_to_do/core/utils/app_strings.dart';
import 'package:up_to_do/core/widget/custom_button.dart';
import 'package:up_to_do/features/task/presentation/components/AddTaskComponents.dart';
import 'package:up_to_do/features/task/presentation/cubit/task_cubit.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

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
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Form(
            
            key: BlocProvider.of<TaskCubit>(context).formkwy,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(30.h),
                    AddTaskComponents(
                      controller: BlocProvider.of<TaskCubit>(
                        context,
                      ).titleController,
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
                      controller: BlocProvider.of<TaskCubit>(
                        context,
                      ).noteController,
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
                      hintText: DateFormat.yMd().format(
                        BlocProvider.of<TaskCubit>(context).currentData,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<TaskCubit>(context).getdata(context);
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    //! Start time
                    Row(
                      children: [
                        Expanded(
                          child: AddTaskComponents(
                            tilte: AppStrings.startTime,
                            hintText: BlocProvider.of<TaskCubit>(
                              context,
                            ).startTime,
                            readOnly: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                BlocProvider.of<TaskCubit>(
                                  context,
                                ).startTimeFn(context);
                              },
                              icon: Icon(
                                Icons.timer_outlined,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        //! Start time
                        //! end time
                        Gap(27.h),
                        Expanded(
                          child: AddTaskComponents(
                            tilte: AppStrings.endTime,
                            hintText: BlocProvider.of<TaskCubit>(
                              context,
                            ).endTime,
                            readOnly: true,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                BlocProvider.of<TaskCubit>(
                                  context,
                                ).endTimeFn(context);
                              },
                              icon: Icon(
                                Icons.timer_outlined,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        //! end time
                      ],
                    ),
                    Text(
                      AppStrings.color,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Gap(10.h),
                    Row(
                      children: List.generate(
                        BlocProvider.of<TaskCubit>(context).arrColors.length,
                        (index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<TaskCubit>(
                                    context,
                                  ).changeCheckMarkIndex(index);
                                },
                                child: CircleAvatar(
                                  backgroundColor: BlocProvider.of<TaskCubit>(
                                    context,
                                  ).arrColors[index],
                                  child:
                                      index ==
                                          BlocProvider.of<TaskCubit>(
                                            context,
                                          ).currentIndex
                                      ? Icon(
                                          Icons.check,
                                          color: AppColors.white,
                                        )
                                      : null,
                                ),
                              ),
                              Gap(8.w),
                            ],
                          );
                        },
                      ),
                    ),
                    Gap(160.h),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: customButton(
                        text: AppStrings.createTask,
                        onPressed: () {
                          BlocProvider.of<TaskCubit>(context).insertData();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
