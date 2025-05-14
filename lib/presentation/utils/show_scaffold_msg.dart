import 'package:flutter/material.dart';

void showScaffoldMessage({
  required BuildContext context,
  required String message,
  Color? bgcolor,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message, style: const TextStyle(fontSize: 18)),
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: bgcolor ?? Colors.black87,
    ),
  );
}
