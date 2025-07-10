import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:up_to_do/core/utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16,
            color: AppColors.white.withOpacity(.44),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
