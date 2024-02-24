import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/feature/task/datamodel/task_model.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({super.key, required this.taskModel});

  final TaskModel taskModel;
  
  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blueGrey;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.purple;
      default:
        return AppColors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: getColor(taskModel.color),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          //column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Text(
                  taskModel.title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8),

                //row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.timer,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${taskModel.startTime} - ${taskModel.endTime}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                //note
                Text(
                  taskModel.note,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),

          //divider
          Container(
            height: 75,
            width: 1,
            color: Colors.white,
            margin: const EdgeInsets.only(right: 10),
          ),
          // const SizedBox(width: 10,),
          //text
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              taskModel.isCompleted == 1
                  ? AppStrings.completed
                  : AppStrings.toDo,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
