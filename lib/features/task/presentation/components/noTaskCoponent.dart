import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:up_to_do/core/utils/app_assets.dart';
import 'package:up_to_do/core/utils/app_strings.dart';

class NoTaskCoponent extends StatelessWidget {
  const NoTaskCoponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 227.w,
            child: Image.asset(AppAssets.noTasks, fit: BoxFit.cover),
          ),
          Gap(30.h),
          Text(
            AppStrings.noTaskTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Gap(10.h),
          Text(
            AppStrings.noTaskSubTitle,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
