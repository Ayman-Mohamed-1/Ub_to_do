import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          textStyle: Theme.of(context).textTheme.displaySmall,
          // TextStyle(
          //   fontSize: 16,
          //   color: AppColors.white.withOpacity(.44),
          //   fontWeight: FontWeight.w400,
          // ),
        ),
      ),
    );
  }
}
