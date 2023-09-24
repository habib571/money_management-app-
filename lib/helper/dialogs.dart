import 'package:flutter/material.dart';

class Dialogs {
  static void showSnackbar(BuildContext contxt, String msg) {
    ScaffoldMessenger.of(contxt).showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor: Colors.blue.withOpacity(.8),
        behavior: SnackBarBehavior.floating));
  }
}