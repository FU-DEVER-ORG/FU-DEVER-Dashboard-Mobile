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
      appBar: AppBar(
        leading: Image.asset('assets/images/fu-dever-logo.png'),
        title: const Text(
          'FU-DEVER',
          style: TextStyle(
            color: Color.fromARGB(1, 0, 152, 255),
          ),
        ),
      ),
      drawer: const MainDrawer(),
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
