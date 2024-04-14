import 'package:flutter/material.dart';
import 'package:fudever_dashboard/modules/notifications_detail/notifications_details_screen.dart';

class ViewNotificationsScreen extends StatefulWidget {
  const ViewNotificationsScreen({super.key});

  @override
  State<ViewNotificationsScreen> createState() =>
      _ViewNotificationScreenState();
}

class _ViewNotificationScreenState extends State<ViewNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 2,
          child: Column(
            children: [
              Image.asset(
                'assets/images/demo-image.png',
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              const Text(
                'Noteworthy technology acquisitions 2021',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const Text(
                'Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.watch_later),
                  Text('August 7th 2023, 6:25:59 am'),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Material(
                          child: NotificationsDetaislScreen(),
                        ),
                      ),
                    );
                  });
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Read more'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
