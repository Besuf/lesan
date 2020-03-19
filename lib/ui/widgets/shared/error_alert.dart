import 'package:flutter/material.dart';

Widget errorAlert(BuildContext context, String message) {
  return message == null || message == ''
      ? Container()
      : Container(
    decoration: BoxDecoration(color: Colors.red),
    width: double.infinity,
    padding: EdgeInsets.all(8.0),
    child: Text(
      message,
      textAlign: TextAlign.center,
      style:
      Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
    ),
  );
}