import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/layouts/auth_layout.dart';
import 'package:fudever_dashboard/modules/screens/auth/login.dart';
import 'package:fudever_dashboard/modules/screens/profile/contacts/contact.dart';
import 'package:fudever_dashboard/modules/screens/profile/favorites/favorites.dart';
import 'package:fudever_dashboard/modules/screens/profile/introduction/introduction.dart';
import 'package:fudever_dashboard/modules/screens/profile/individual_information/individual_information.dart';
import 'package:fudever_dashboard/modules/screens/profile/password/change_password.dart';
import 'package:fudever_dashboard/modules/screens/profile/qrcode_member_card/qrcode_member_card.dart';
import 'package:fudever_dashboard/modules/screens/profile/skills/skill.dart';
import 'package:fudever_dashboard/modules/screens/profile/social_media/social_media.dart';
import 'package:fudever_dashboard/modules/widgets/image_input.dart';
import 'package:fudever_dashboard/provider/image_provider.dart'; // Import the image provider

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<ProfileScreen> {
  File? _selectedImage;
  bool _isImageCaptured = false;
  bool _isConfirmed = false;

  List<Map<String, dynamic>> listItems = [
    {
      'icon': Icons.edit,
      'title': 'Giới thiệu',
      'screen': const IntroductionScreen(title: 'Giới thiệu')
    },
    {
      'icon': Icons.error,
      'title': 'Thông tin cá nhân',
      'screen': const IndividualInformationScreen(title: 'Thông tin cá nhân')
    },
    {
      'icon': Icons.contacts_rounded,
      'title': 'Liên hệ',
      'screen': const ContactsScreen(title: 'Liên hệ')
    },
    {
      'icon': Icons.public,
      'title': 'Mạng xã hội',
      'screen': const SocialMediaScreen(title: 'Mạng xã hội')
    },
    {
      'icon': Icons.favorite,
      'title': 'Sở thích',
      'screen': const FavoritesScreen(title: 'Sở thích')
    },
    {
      'icon': Icons.lightbulb,
      'title': 'Kỹ năng',
      'screen': const SkillsScreen(title: 'Kỹ năng')
    },
    {
      'icon': Icons.lock,
      'title': 'Đổi mật khẩu',
      'screen': const ChangePasswordScreen(title: 'Đổi mật khẩu')
    },
  ];
void _saveImage(BuildContext context) async {
  if (_selectedImage != null) {
    ref.read(userImageProvider.notifier).changeProfileInfo(
          'User Name',
          _selectedImage!,
        ); // Replace 'User Name' with the actual user name

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Image saved successfully'),
      ),
    );
  }
}


  PreferredSizeWidget _buildProfileHeader(BuildContext context) {
    return AppBar(
      foregroundColor: Theme.of(context).colorScheme.onBackground,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      title: Text(
        'Hồ sơ cá nhân',
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
      actions: [
        if (_isImageCaptured && !_isConfirmed)
          GestureDetector(
            onTap: () {
              _saveImage(context);
              setState(() {
                _isConfirmed = true;
              });
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(Icons.check, color: Colors.blue),
            ),
          )
        else
          GestureDetector(
            onTap: () {
              // Navigate to QR code screen and set checkmark
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const QrCodeMember();
                  },
                ),
              ).then((_) {
                setState(() {
                  _isImageCaptured = false;
                  _isConfirmed = false;
                });
              });
            },
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
    return ImageInput(
      onPickImage: (image) {
        _saveImage(context);
        setState(() {
          _selectedImage = image;
          _isImageCaptured = true;
          _isConfirmed = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildProfileHeader(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              'email@gmail.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = listItems[index];
                return _buildListTile(item['icon'], item['title'], () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => item['screen']));
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthLayout(
                        body: const Login(),
                        title: "Đăng nhập",
                        trailing: Login.trailing(context),
                      ),
                    ),
                    (route) => true,
                  );
                },
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
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return SizedBox(
      height: 40,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.blue,
        ),
        onTap: onTap,
      ),
    );
  }
}
