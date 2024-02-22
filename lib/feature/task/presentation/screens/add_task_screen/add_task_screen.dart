import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/commons/commos.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/feature/task/presentation/components/add_task_component.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  late DateTime currentDate = DateTime.now();

  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            navigator(context: context, screen: const HomeScreen());
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
            child: Column(
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
                  controller: noteController,
                  hint: DateFormat.yMd().format(currentDate),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030));
                      setState(() {
                        if (selectedDate != null) {
                          currentDate = selectedDate;
                        }
                      });
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
                        hint: startTime,
                        suffixIcon: IconButton(
                            onPressed: () async {
                              TimeOfDay? pickedStartTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      TimeOfDay.fromDateTime(DateTime.now()));
                              setState(() {
                                if (pickedStartTime != null) {
                                  startTime = pickedStartTime.format(context);
                                }
                              });
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
                        hint: endTime,
                        suffixIcon: IconButton(
                            onPressed: () async {
                              TimeOfDay? pickedEndTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      TimeOfDay.fromDateTime(DateTime.now()));
                              setState(() {
                                if (pickedEndTime != null) {
                                  endTime = pickedEndTime.format(context);
                                }
                              });
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
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 23,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            Color getColor(index) {
                              switch (index) {
                                case 0:
                                  return AppColors.blue;
                                case 1:
                                  return AppColors.green;
                                case 2:
                                  return AppColors.red;
                                case 3:
                                  return AppColors.blueGrey;
                                case 4:
                                  return AppColors.orange;
                                case 5:
                                  return AppColors.purple;
                                default:
                                  return AppColors.grey;
                              }
                            }

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: getColor(index),
                                child: index == currentIndex
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
            ),
          ),
        ),
      ),
    );
  }
}
