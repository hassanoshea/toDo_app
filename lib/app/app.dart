
import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/feature/auth/screens/splash_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: getAppTheme(),
      darkTheme: getAppDarkTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen()
    );
    
  }
}