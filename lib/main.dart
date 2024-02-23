import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/app/app.dart';
import 'package:to_do_app/core/bloc/bloc.dart';
import 'package:to_do_app/core/database/cashe_helper.dart';
import 'package:to_do_app/core/database/sqflite_helper.dart';
import 'package:to_do_app/core/service/service_locator.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setup();
  await sl<CacheHelper>().init();
  sl<SqfliteHelper>().intiDB();

  runApp(
    BlocProvider(
      create: (context) => TaskCubit()..getTheme()..getTasks(),
      child: const MyApp(),
    ),
  );
}
