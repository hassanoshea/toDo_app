import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/commons/commons.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/feature/task/presentation/components/task_component.dart';
import 'package:to_do_app/feature/task/presentation/cubit/cubit_state.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/feature/task/presentation/screens/add_task_screen/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TaskCubit>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //date now
                  Row(
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()),
                          style: Theme.of(context).textTheme.displayLarge),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          cubit.changeTheme();
                        },
                        icon: Icon(
                          Icons.mode_night,
                          color: cubit.isDark
                              ? AppColors.white
                              : AppColors.background,
                        ),
                      )
                    ],
                  ),
                   SizedBox(
                    height: 12.h),

                  //Today
                  Text(AppStrings.today,
                      style: Theme.of(context).textTheme.displayLarge),

                  //date picker
                  DatePicker(
                    height: 95.h,
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primary,
                    selectedTextColor: AppColors.white,
                    dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                    dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                    monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                    onDateChange: (date) {
                    cubit.getSelectedDate(date);
                    },
                  ),
                   SizedBox(
                    height: 24.h),

                  //no tasks
                  cubit.tasksList.isEmpty
                      ? noTasksWidget(context)
                      : Expanded(
                          child: ListView.builder(
                            itemCount: cubit.tasksList
                                .length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          padding: const EdgeInsets.all(24),
                                          height: 240.h,
                                          color: AppColors.deepGrey,
                                          child: Column(
                                            children: [
                                              //taskCompleted
                                              cubit.tasksList[index].isCompleted == 1
                                                  ? Container()
                                                  : SizedBox(
                                                      height: 48.h,
                                                      width: double.infinity,
                                                      child: CustomButton(
                                                        text: AppStrings
                                                            .taskCompleted,
                                                        onPressed: () {
                                                          cubit.updateTask(cubit.tasksList[index].id);
                                                                  showToast(message:AppStrings.completed, state: ToastStates.success);
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ),
                                              SizedBox(
                                                height: 24.h,
                                              ),

                                              //deleteTask
                                              SizedBox(
                                                height: 48,
                                                width: double.infinity,
                                                child: CustomButton(
                                                  text: AppStrings.deleteTask,
                                                  backgroundColor:
                                                      AppColors.red,
                                                  onPressed: () {
                                                    cubit.deleteTask(cubit.tasksList[index].id);
                                                    showToast(message:'Deleted', state: ToastStates.error);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),

                                              //cancel
                                              SizedBox(
                                                height: 48,
                                                width: double.infinity,
                                                child: CustomButton(
                                                  text: AppStrings.cancel,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: TaskComponent(
                                    taskModel:
                                        cubit.tasksList[index],
                                  ));
                            },
                          ),
                        ),
                ],
              );
            },
          ),
        ),
        //fab
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigate(context: context, screen: const AddTaskScreen());
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Column noTasksWidget(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.noTasks),
        Text(
          AppStrings.noTaskTitle,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 24,
              ),
        ),
        Text(
          AppStrings.noTaskSubTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
