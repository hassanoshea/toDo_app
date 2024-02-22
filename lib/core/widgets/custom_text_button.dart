import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors.white.withOpacity(.44), fontSize: 16)),
      onPressed: () {
        onPressed();
      },
    );
  }
}
