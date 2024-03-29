import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/database/cashe_helper.dart';
import 'package:to_do_app/core/database/sqflite_helper.dart';
import 'package:to_do_app/core/service/service_locator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/feature/task/datamodel/task_model.dart';
import 'package:to_do_app/feature/task/presentation/cubit/cubit_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  DateTime currentDate = DateTime.now();
  DateTime selctedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int currentIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<TaskModel> tasksList = [];

  //get Date From User
  void getDate(context) async {
    emit(GetDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDateSucessState());
    } else {
      emit(GetDateErrorState());
    }
  }

  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());

    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      emit(GetStartTimeSucessState());
    } else {
      emit(GetStartTimeErrorState());
    }
  }

  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());

    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(GetEndTimeSucessState());
    } else {
      emit(GetEndTimeErrorState());
    }
  }

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

  void changeCheckMarkIndex(index) {
    currentIndex = index;
    emit(ChangeCheckMarkIndexState());
  }

  void getSelectedDate(date) {
    emit(GetSelectedDateLoadingState());
    selctedDate = date;
    emit(GetSelectedDateSucessState());
    getTasks();
  }
  
  void insertTask() async {
    emit(InsertTaskLoadingState());
    try {
      await sl<SqfliteHelper>().insertToDB(
        TaskModel(
          date: DateFormat.yMd().format(currentDate),
          title: titleController.text,
          note: noteController.text,
          startTime: startTime,
          endTime: endTime,
          isCompleted: 0,
          color: currentIndex,
        ),
      );
      titleController.clear();
      noteController.clear();
      emit(InsertTaskSucessState());
      getTasks();
    } catch (e) {
      emit(InsertTaskErrorState());
    }
  }

//!get Tasks
  void getTasks() async {
    emit(GetTaskLoadingState());
    await sl<SqfliteHelper>().getFromDB().then((value) {
      tasksList = value.map((e) => TaskModel.fromJson(e))
          .toList()
          .where(
            (element) => element.date == DateFormat.yMd().format(selctedDate),
          )
          .toList();
      emit(GetTaskSucessState());
    }).catchError((e) {
      emit(GetTaskErrorState());
    });
  }

  //update Task
  void updateTask(id) async {
    emit(UpdateTaskLoadingState());

    await sl<SqfliteHelper>().updatedDB(id).then((value) {
      emit(UpdateTaskSucessState());
      getTasks();
    }).catchError((e) {
      emit(UpdateTaskErrorState());
    });
  }

//delete task
  void deleteTask(id) async {
    emit(DeleteTaskLoadingState());

    await sl<SqfliteHelper>().deleteFromDB(id).then((value) {
      emit(DeleteTaskSucessState());
      getTasks();
    }).catchError((e) {
      emit(DeleteTaskErrorState());
    });
  }

  bool isDark = false;
  void changeTheme() async {
    isDark = !isDark;
    await sl<CacheHelper>().saveData(key: 'isDark', value: isDark);
    emit(ChangeThemeState());
  }
 void getTheme()async{
  isDark =await sl<CacheHelper>().getData(key: 'isDark');
  emit(GetThemeState());
 }
}