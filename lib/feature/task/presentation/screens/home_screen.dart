import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //date now
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 12),
              //Today
              Text(
                AppStrings.today,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10),
              //date picker
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: AppColors.white,
                height: 97,
                dateTextStyle: Theme.of(context).textTheme.displaySmall!,
                dayTextStyle: Theme.of(context).textTheme.displaySmall!,
                monthTextStyle: Theme.of(context).textTheme.displaySmall!,
                onDateChange: (date) {
                  // BlocProvider.of<TaskCubit>(context).getSelectedDate(date);
                },
              ),
              const SizedBox(height: 24),
              //no Tasks
              noTassksWidgets(context)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Column noTassksWidgets(BuildContext context) {
    return Column(children: [
      const SizedBox(width: 500),
      //Image
      Image.asset(AppAssets.noTasks),

      //Title Text
      Text(AppStrings.noTaskTitle,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 24)),

      //SubTitle Text
      Text(AppStrings.noTaskSubTitle,
          style: Theme.of(context).textTheme.displayMedium)
    ]);
  }
}
