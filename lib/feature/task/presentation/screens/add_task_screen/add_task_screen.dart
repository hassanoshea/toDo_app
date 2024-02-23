import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/commons/commons.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/feature/task/presentation/components/add_task_component.dart';
import 'package:to_do_app/feature/task/presentation/cubit/cubit_state.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final TextEditingController titleController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  late DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            navigate(context: context, screen: const HomeScreen());
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: AppColors.white,
        ),
        title: Text(AppStrings.addTask,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 28)),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<TaskCubit>(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    AddTaskComponent(
                        title: AppStrings.title,
                        controller: titleController,
                        hint: AppStrings.titleHint),
                    SizedBox(height: 24.h),
            
                    // Note
                    AddTaskComponent(
                        title: AppStrings.note,
                        controller: noteController,
                        hint: AppStrings.noteHint),
                    SizedBox(height: 24.h),
            
                    //Date
                    AddTaskComponent(
                      title: AppStrings.date,
                      hint: DateFormat.yMd().format(cubit.currentDate),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          cubit.getDate(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.white,
                        ),
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        //start time
                        Expanded(
                          child: AddTaskComponent(
                            readOnly: true,
                            title: AppStrings.startTime,
                            hint: cubit.startTime,
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  cubit.getStartTime(context);
                                },
                                icon: const Icon(
                                  Icons.alarm,
                                  color: AppColors.white,
                                )),
                          ),
                        ),
                        SizedBox(width: 26.w),
            
                        //end time
                        Expanded(
                          child: AddTaskComponent(
                            readOnly: true,
                            title: AppStrings.endTime,
                            hint: cubit.endTime,
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  cubit.getEndTime(context);
                                },
                                icon: const Icon(
                                  Icons.alarm,
                                  color: AppColors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    //color
                    SizedBox(
                      height: 68,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.color,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 5.h),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 23,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                cubit.getColor(index);
            
                                return InkWell(
                                  onTap: () {
                                    cubit.changeCheckMarkIndex(index);
                                  },
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: cubit.getColor(index),
                                    child: index == cubit.currentIndex
                                        ? const Icon(
                                            Icons.check,
                                            color: AppColors.white,
                                            size: 25,
                                          )
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //add task button
                    SizedBox(
                      height: 90.h,
                    ),
                    SizedBox(
                      height: 48.h,
                      width: double.infinity,
                      child: CustomElevatedButton(
                          text: AppStrings.createTask, onPressed: () {}),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
