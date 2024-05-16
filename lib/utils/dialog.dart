import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoginErrorDialog(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Đăng nhập thất bại'),
          content: const Text('Sai email hoặc mật khẩu'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titleTextStyle: const TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
            title: const Text('Đăng nhập thất bại'),
            content: const Text('Sai email hoặc mật khẩu'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
