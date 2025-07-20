import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:up_to_do/core/commons/commons.dart';
import 'package:up_to_do/core/utils/app_colors.dart';
import 'package:up_to_do/core/utils/app_strings.dart';
import 'package:up_to_do/features/task/presentation/components/TaskCardComponent.dart';

import 'package:up_to_do/features/task/presentation/screens/add_task/add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Gap(12.h),
                Text(
                  AppStrings.today,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Gap(12.h),
                DatePicker(
                  DateTime.now(),
                  width: 60.w,
                  height: 100.h,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.primary,
                  selectedTextColor: AppColors.white,
                  dateTextStyle: Theme.of(context).textTheme.displaySmall!
                      .copyWith(
                        fontSize: 20.sp,
                        color: AppColors.white.withOpacity(.8),
                      ),
                  dayTextStyle: Theme.of(context).textTheme.displaySmall!
                      .copyWith(color: AppColors.white.withOpacity(.8)),
                  monthTextStyle: Theme.of(context).textTheme.displaySmall!
                      .copyWith(color: AppColors.white.withOpacity(.8)),
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      // _selectedValue = date;
                    });
                  },
                ),
                Gap(11.h),
                // NoTaskCoponent(),
                TaskCardComponent(),
                TaskCardComponent(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navegat(context: context, screen: AddTask());
          },
          backgroundColor: AppColors.primary,
          shape: CircleBorder(),
          child: Icon(Icons.add, color: AppColors.white),
        ),
      ),
    );
  }
}
