import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/screens/members/profile.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {


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
              //Notifications
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Members'),
            trailing: DropdownButton<int>(
              hint: const Text('Show more'),
              items: const [
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Member Lists'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('Profile'),
                ),
                DropdownMenuItem<int>(
                  value: 3,
                  child: Text('Settings'),
                ),
              ],
              onChanged: (value) {
                switch (value) {
                  case 1:
                    //Member Lists
                    break;
                  case 2:
                    Navigator.of(context).pushNamed('profile');
                    break;
                  case 3:
                    //Setting
                    break;
                  default:
                    break;
                }
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Blogs'),
            onTap: () {
              //Blogs
            },
          ),
        ],
      ),
    );
  }
}
