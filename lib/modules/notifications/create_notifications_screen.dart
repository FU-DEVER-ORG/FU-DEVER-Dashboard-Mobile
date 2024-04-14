import 'package:flutter/material.dart';

class CreateNotificationsScreen extends StatefulWidget {
  const CreateNotificationsScreen({super.key});

  @override
  State<CreateNotificationsScreen> createState() =>
      _CreateNotificationScreenState();
}

class _CreateNotificationScreenState extends State<CreateNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Notifications title'),
        const TextField(
          maxLength: 50,
          decoration: InputDecoration(
            label: Text('Title'),
          ),
        ),
        const Text('Notification Thumbnail'),
        Card(
          child: Center(
            child: Column(
              children: [
                //TODO_add more widgets
                ElevatedButton.icon(
                  onPressed: () {
                    //TODO_Add action here
                  },
                  icon: const Icon(Icons.search),
                  label: const Text('Browse File'),
                ),
              ],
            ),
          ),
        ),
        const Text('Notification content'),
      ],
    );
  }
}
