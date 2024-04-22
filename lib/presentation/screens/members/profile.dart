import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset('assets/images/demo-image.png'),
              const Text(
                'Unnamed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.work),
                  Text('Not set yet'),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.calendar_month),
                  Text('01-01-2000'),
                ],
              ),
              const Text('Email address:'),
              const Text(
                '...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Phone number'),
              const Text(
                '...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Social media',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                '...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            children: [
              Text(
                'Unnamed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                'Social media',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text('Nothing here'),
            ],
          ),
        ),
      ],
    );
  }
}
