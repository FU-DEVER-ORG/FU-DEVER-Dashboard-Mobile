import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/modules/screens/profile/contacts/contact.dart';
import 'package:fudever_dashboard/modules/screens/profile/favorites/favorites.dart';
import 'package:fudever_dashboard/modules/screens/profile/introduction/introduction.dart';
import 'package:fudever_dashboard/modules/screens/profile/individual_information/individual_information.dart';
import 'package:fudever_dashboard/modules/screens/profile/password/change_password.dart';
import 'package:fudever_dashboard/modules/screens/profile/skills/skill.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  PreferredSizeWidget _buildProfileHeader(BuildContext context) {
    return AppBar(
      foregroundColor: Theme.of(context).colorScheme.onBackground,
      title: Text(
        'Hồ sơ cá nhân',
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: SvgPicture.asset('assets/images/QR.svg'),
          ),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Stack(
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
            ),
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildProfileHeader(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildProfileImage(context),
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
              _buildListTile(
                icon: Icons.edit,
                title: 'Giới thiệu',
                iconColor: Colors.blue,
              ),
              _buildListTile(
                icon: Icons.error,
                title: 'Thông tin cá nhân',
                iconColor: Colors.blue,
              ),
              _buildListTile(
                icon: Icons.contacts_rounded,
                title: 'Liên hệ',
                iconColor: Colors.blue,
              ),
              _buildListTile(
                icon: Icons.public,
                title: 'Mạng xã hội',
                iconColor: Colors.blue,
              ),
              _buildListTile(
                icon: Icons.favorite,
                title: 'Sở thích',
                iconColor: Colors.blue,
              ),
              _buildListTile(
                icon: Icons.lightbulb,
                title: 'Kỹ năng',
                iconColor: Colors.blue,
              ),
              _buildListTile(
                icon: Icons.lock,
                title: 'Đổi mật khẩu',
                iconColor: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    fixedSize: const Size(double.maxFinite, 51),
                  ),
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Đăng xuất',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required Color iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        switch (title) {
          case 'Giới thiệu':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => IntroductionScreen(title: title),
              ),
            );
          case 'Thông tin cá nhân':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => IndividualInformationScreen(title: title),
              ),
            );
          case 'Liên hệ':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ContactsScreen(title: title),
              ),
            );
          case 'Mạng xã hội':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => IntroductionScreen(title: title),
              ),
            );
          case 'Sở thích':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => FavoritesScreen(title: title),
              ),
            );
          case 'Kỹ năng':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => SkillsScreen(title: title),
              ),
            );
          case 'Đổi mật khẩu':
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ChangePasswordScreen(title: title),
              ),
            );
          default:
        }
      },
    );
  }
}
