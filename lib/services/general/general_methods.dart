import 'package:flutter/material.dart';

void showAlert(String alertTitle, String alertContent, BuildContext context) {
  AlertDialog alertDialog;
  alertDialog =
      AlertDialog(title: Text(alertTitle), content: Text(alertContent));
  showDialog(context: context, builder: (_) => alertDialog);
}