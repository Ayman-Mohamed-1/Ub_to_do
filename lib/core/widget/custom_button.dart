import 'package:flutter/material.dart';
import 'package:up_to_do/core/utils/app_colors.dart';

class customButton extends StatelessWidget {
  const customButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: AppColors.white)),
    );
  }
}
