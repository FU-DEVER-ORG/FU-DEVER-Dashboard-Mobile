import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({required this.body, super.key});
  final Widget body;

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        )
      ),
      body: widget.body,
    );
  }
}
