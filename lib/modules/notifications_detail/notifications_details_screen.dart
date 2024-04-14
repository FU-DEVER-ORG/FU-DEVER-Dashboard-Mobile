import 'package:flutter/material.dart';

class NotificationsDetaislScreen extends StatelessWidget {
  const NotificationsDetaislScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Text('data'),
          Row(
            children: [
              Icon(Icons.watch_later),
              Text('date'),
            ],
          ),
          Text('data'),
        ],
      ),
    );
  }
}
