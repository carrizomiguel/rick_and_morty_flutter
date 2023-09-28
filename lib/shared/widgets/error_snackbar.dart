import 'package:flutter/material.dart';

SnackBar errorSnackbar(String message) {
  return SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.startToEnd,
    margin: const EdgeInsets.only(
      left: 15,
      right: 15,
      bottom: 20,
    ),
  );
}
