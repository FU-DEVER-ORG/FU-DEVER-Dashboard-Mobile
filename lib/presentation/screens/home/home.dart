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
          // leading: Image.asset('assets/images/fu-dever-logo.png'),
          title: Row(
        children: [
          Image.asset(
            'assets/images/fu-dever-logo.png',
            width: 60,
            height: 60,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text('FU - DEVER')
        ],
      )),
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
