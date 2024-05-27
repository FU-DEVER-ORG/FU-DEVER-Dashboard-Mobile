import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoginErrorDialog(BuildContext context) {
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
  }
}
