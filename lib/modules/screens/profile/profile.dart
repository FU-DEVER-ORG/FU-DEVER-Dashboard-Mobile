import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        title: Text(
          'Hồ sơ cá nhân',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Stack(
              children: <Widget>[
                ClipOval(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.asset(
                      'assets/images/demo-image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      // border: Border.all(color: Colors.grey, width: 4)
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          print('Camera button pressed!');
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Name',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'emaiil@gmail.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.edit),
              title: Text('Giới thiệu'),
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: Colors.blue,
            ),
            const ListTile(
              leading: Icon(Icons.error),
              title: Text('Thông tin cá nhân'),
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: Colors.blue,
            ),
            const ListTile(
              leading: Icon(Icons.contacts_rounded),
              title: Text('Liên hệ'),
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: Colors.blue,
            ),
            const ListTile(
              leading: Icon(Icons.public),
              title: Text('Mạng xã hội'),
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: Colors.blue,
            ),
            const ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Sở thích'),
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: Colors.blue,
            ),
            const ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text('Kỹ năng'),
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: Colors.blue,
            ),
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text('Đổi mật khẩu'),
              trailing: Icon(Icons.arrow_forward_ios),
              iconColor: Colors.blue,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: const Text(
                'Đăng xuất',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
