import 'package:flutter/material.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent(
      {super.key,
      required this.title,
      this.controller,
      required this.hint,
      this.suffixIcon,
      this.readOnly = false});

  final String title;
  final TextEditingController? controller;
  final String hint;
  final IconButton? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 8),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(hintText: hint, suffixIcon: suffixIcon),
        ),
      ],
    );
  }
}
