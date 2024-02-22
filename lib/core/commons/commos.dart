import 'package:flutter/material.dart';

void navigator({required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
}
