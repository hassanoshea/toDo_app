import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/commons/commos.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/feature/task/presentation/screens/add_task_screen/add_task_screen.dart';

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
              // noTassksWidgets(context)
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(24),
                            height: 240,
                            color: AppColors.deepGrey,
                            child: Column(
                              children: [
                                //task completed
                                SizedBox(
                                    height: 48,
                                    width: double.infinity,
                                    child: CustomElevatedButton(
                                        text: AppStrings.taskCompleted,
                                        onPressed: () {})),
                                        const SizedBox(height: 24),

                                //deleteTask
                                SizedBox(
                                    height: 48,
                                    width: double.infinity,
                                    child: CustomElevatedButton(
                                      color: AppColors.red,
                                        text: AppStrings.deleteTask,
                                        onPressed: () {})),
                                        const SizedBox(height: 24),

                                //Cancel
                                SizedBox(
                                    height: 48,
                                    width: double.infinity,
                                    child: CustomElevatedButton(
                                        text: AppStrings.cancel,
                                        onPressed: () {})),
                              ],
                            ),
                          );
                        });
                  },
                  child: const TaskComponant()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigator(context: context, screen: AddTaskScreen());
          },
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

class TaskComponant extends StatelessWidget {
  const TaskComponant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          //column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //text
                Text('Task 1', style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 8),

                //row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.timer, color: AppColors.white),
                    const SizedBox(width: 8),
                    Text(
                      '9:30 PM - 9:33 PM',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                //text
                Text('Learn Me',
                    style: Theme.of(context).textTheme.displayLarge)
              ],
            ),
          ),

          //divider
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 75,
            width: 1,
            color: AppColors.white,
          ),

          //text
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              AppStrings.toDo,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
