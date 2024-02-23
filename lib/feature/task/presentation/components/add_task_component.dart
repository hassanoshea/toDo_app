import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.validator,
  });

  final String title;
  final String hint;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.displayMedium),
        SizedBox(height: 8.h),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(hintText: hint, suffixIcon: suffixIcon, fillColor: AppColors.deepGrey),
        ),
      ],
    );
  }
}
