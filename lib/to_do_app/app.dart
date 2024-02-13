
import 'package:flutter/material.dart';
import 'package:to_do_app/core/app_assets.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Image.asset(AppAssets.logo),
        ),
      ),
    );
  }
}