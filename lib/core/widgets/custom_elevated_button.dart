import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = AppColors.primary});

  final String text;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context)
          .elevatedButtonTheme
          .style!
          .copyWith(backgroundColor: 
          MaterialStatePropertyAll(color)),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: AppColors.white),
      ),
    );
  }
}
