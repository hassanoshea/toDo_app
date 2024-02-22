import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskComponent extends StatelessWidget {
<<<<<<< HEAD

  const AddTaskComponent({
    super.key,
    required this.tilte,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.validator,
  });
  
  final String tilte;
  final String hintText;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;
=======
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
>>>>>>> 47d420bcc8accbe44dc28be324fb65d4ac19cf13

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
<<<<<<< HEAD
        Text(
          tilte,
          style: Theme.of(context).textTheme.displayMedium,
        ),
=======
        Text(title, style: Theme.of(context).textTheme.displayMedium),
>>>>>>> 47d420bcc8accbe44dc28be324fb65d4ac19cf13
        SizedBox(height: 8.h),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
<<<<<<< HEAD
          validator: validator,
          decoration: InputDecoration(
            //hint
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
=======
          decoration: InputDecoration(hintText: hint, suffixIcon: suffixIcon),
>>>>>>> 47d420bcc8accbe44dc28be324fb65d4ac19cf13
        ),
      ],
    );
  }
}
