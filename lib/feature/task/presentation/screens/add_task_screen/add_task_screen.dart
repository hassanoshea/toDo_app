import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/feature/task/presentation/components/add_task_component.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
          color: AppColors.white,
        ),
        title: Text(AppStrings.addTask,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 28)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              AddTaskComponent(
                  title: AppStrings.title,
                  controller: titleController,
                  hint: AppStrings.titleHint),
              const SizedBox(height: 24),

              // Note
              AddTaskComponent(
                  title: AppStrings.note,
                  controller: noteController,
                  hint: AppStrings.noteHint),
              const SizedBox(height: 24),

              //Date
              AddTaskComponent(
                title: AppStrings.date,
                controller: noteController,
                hint: DateFormat.yMd().format(currentDate),
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030));
                    currentDate = selectedDate!;
                  },
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                    color: AppColors.white,
                  ),
                ),
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
