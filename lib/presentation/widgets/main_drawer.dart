import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListView(
            children: <Widget>[
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
            ],
          ),
          ListView(
            children: <Widget>[
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
                      const PopupMenuItem(
                        value: 2,
                        child: Text('Profile'),
                      ),
                      const PopupMenuItem(
                        value: 3,
                        child: Text('Settings'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          ListView(
            children: <Widget>[
              ListTile(
                // leading: const Icon(Icons.),
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
                        value: 3,
                        child: Text('Create Blog'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
