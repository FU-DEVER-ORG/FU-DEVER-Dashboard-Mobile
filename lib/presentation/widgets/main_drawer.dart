import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/screens/members/profile.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  void _tapOnProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
        children: [
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(0, 100, 0, 0),
                items: [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('View notifications'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Create notifications'),
                  ),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Members'),
            onTap: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(0, 100, 0, 0),
                items: [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Member Lists'),
                  ),
                  PopupMenuItem(
                    value: 2,
                    onTap: () => _tapOnProfile(context),
                    child: const Text('Profile'),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text('Settings'),
                  ),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Blogs'),
            onTap: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(0, 100, 0, 0),
                items: [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Blogs list'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Your blogs'),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text('Pending Blog'),
                  ),
                  const PopupMenuItem(
                    value: 4,
                    child: Text('Create Blog'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
