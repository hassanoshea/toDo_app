import 'package:flutter/material.dart';
import 'package:to_do_app/app/app.dart';
import 'package:to_do_app/core/database/cashe_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  //singelton design pattern by Get It Package
  setUp();
  await sl<CacheHelper>().init();
  runApp(const ToDoApp());
}
