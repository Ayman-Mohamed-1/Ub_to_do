import 'package:flutter/material.dart';
import 'package:up_to_do/core/utils/app_colors.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  });
  final String text;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
      ),
      child: Text(text, style: TextStyle(color: AppColors.white)),
    );
  }
}
