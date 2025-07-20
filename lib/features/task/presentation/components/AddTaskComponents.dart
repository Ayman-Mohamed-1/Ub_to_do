// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AddTaskComponents extends StatelessWidget {
  const AddTaskComponents({
    super.key,
    required this.tilte,
    required this.hintText,
    this.readOnly = false,
    this.suffixIcon,
    this.validator,
    this.controller,
  });

  final String tilte;
  final String hintText;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tilte, style: Theme.of(context).textTheme.displaySmall),
        SizedBox(height: 8.h),
        TextFormField(
          style: Theme.of(context).textTheme.displaySmall,
          cursorHeight: 30.h,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            //hint
            hintText: hintText,
            // hintStyle:
            suffixIcon: suffixIcon,
          ),
        ),
        Gap(24),
      ],
    );
  }
}
