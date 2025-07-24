import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:up_to_do/core/utils/app_colors.dart';

void navegat({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
}

void navegatPop({required BuildContext context}) {
  Navigator.pop(context);
}

void showToast({required String msg, required ToastStates state}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: getState(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates { error, succcess, warining }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.succcess:
      return AppColors.green;
    case ToastStates.warining:
      return AppColors.orange;
  }
}
