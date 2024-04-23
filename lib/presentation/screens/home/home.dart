import 'package:flutter/material.dart';

import '../../widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          children: [
            Text('FU - DEVER'),
            Text('Welcome!'),
          ],
        ),
      ),
    );
  }
}
