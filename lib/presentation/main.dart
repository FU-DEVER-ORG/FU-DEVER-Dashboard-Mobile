import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/screens/home/splash.dart';
import './screens/home/home.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    ),
  );
}
