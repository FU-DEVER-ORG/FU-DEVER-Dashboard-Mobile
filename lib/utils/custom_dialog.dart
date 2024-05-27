import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static showCustomDialog({
    context,
    final Function()? onPressedCheck,
    final String? title,
    final String? content,
    final String? cancelButton,
    final String? acceptButton,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Column(
          children: [
            Text(
              title ?? "",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Text(
          content ?? "",
          style: const TextStyle(fontSize: 16),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              cancelButton ?? "",
              style: const TextStyle(color: Colors.blue, fontSize: 18),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            onPressed: onPressedCheck,
            child: Text(
              acceptButton ?? "",
              style: const TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
