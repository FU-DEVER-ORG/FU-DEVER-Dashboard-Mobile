import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/controller/id_manager.dart';
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
import 'package:fudever_dashboard/provider/image_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/cloudinary_api.dart';
import '../home/home.dart'; // Import the image provider

class ProfileScreen extends ConsumerStatefulWidget {
  ProfileScreen({
    Key? key,
    data = null,
  }) : super(key: key);

  Map<String, dynamic>? data;
  @override
  ConsumerState<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<ProfileScreen> {
  File? _selectedImage;
  bool _isImageCaptured = false;
  bool _isConfirmed = false;

  List<Map<String, dynamic>>? listItems = [];

  List<Map<String, dynamic>> getListItems(Map<String, dynamic> data) {
    listItems = [
      {
        'icon': Icons.edit,
        'title': 'Giới thiệu',
        'screen':
            IntroductionScreen(title: 'Giới thiệu', data: data['description'])
      },
      {
        'icon': Icons.error,
        'title': 'Thông tin cá nhân',
        'screen':
            IndividualInformationScreen(title: 'Thông tin cá nhân', data: data)
      },
      {
        'icon': Icons.contacts_rounded,
        'title': 'Liên hệ',
        'screen': ContactsScreen(
            title: 'Liên hệ',
            data: {"email": data['email'], "phone": data['phone']})
      },
      {
        'icon': Icons.public,
        'title': 'Mạng xã hội',
        'screen': SocialMediaScreen(title: 'Mạng xã hội', data: data['socials'])
      },
      {
        'icon': Icons.favorite,
        'title': 'Sở thích',
        'screen': FavoritesScreen(title: 'Sở thích', data: data['favourites'])
      },
      {
        'icon': Icons.lightbulb,
        'title': 'Kỹ năng',
        'screen': SkillsScreen(title: 'Kỹ năng', data: data['skills'])
      },
      {
        'icon': Icons.lock,
        'title': 'Đổi mật khẩu',
        'screen': const ChangePasswordScreen(title: 'Đổi mật khẩu')
      },
    ];
    return listItems!;
  }

  Future<Map<String, dynamic>> getUserDetail() async {
    if (widget.data == null) {
      dynamic response = await UserController.getUserDetail();
      return response['data'];
    }
    return widget.data!['data'];
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _saveImage(BuildContext context) async {
    if (_selectedImage != null) {
      final _imageUrl = await CloudinaryApi().uploadImage(_selectedImage!);
      if (_imageUrl != null) {
        final response =
            await UserController.editUsers(options: {'avatar': _imageUrl});
        if (response['status'] == 'success') {
          ref.read(userImageProvider.notifier).changeProfileInfo(
                _selectedImage!,
              ); // Replace 'User Name' with the actual user name

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Image saved successfully'),
            ),
          );
          Navigator.of(context).pop(
            MaterialPageRoute(
              builder: (ctx) => HomeScreen(),
            ),
          );
        } else {
          // Handle error case
        }
      }
    }
  }

  PreferredSizeWidget _buildProfileHeader(BuildContext context) {
    return AppBar(
      foregroundColor: Theme.of(context).colorScheme.onBackground,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          bool profileUpdated = true;
          Navigator.pop(context, profileUpdated);
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
    final Future<String?> userId = IdManager().getId();

    return FutureBuilder(
      future: getUserDetail(),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.white,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children: [
              ImageInput(
                onPickImage: (image) async {
                  setState(() {
                    _selectedImage = image;
                    _isImageCaptured = true;
                    _isConfirmed = false;
                  });
                },
                imageUrl: snapshot.data?['avatar'],
              ),
              const SizedBox(height: 20),
              Text(
                '${snapshot.data?['firstname']} ${snapshot.data?['lastname']}',
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                snapshot.data?['email'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return Center(
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
            FutureBuilder<Map<String, dynamic>>(
              future: getUserDetail(),
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 280,
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  Map<String, dynamic> data = snapshot.data!;
                  List<Map<String, dynamic>> listItems = getListItems(data);

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = listItems[index];
                      return _buildListTile(item['icon'], item['title'],
                          () async {
                        // Await the navigation and capture the result.
                        bool? isUpdated = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => item['screen'],
                          ),
                        );

                        // Provide a default value of `false` if `isUpdated` is null.
                        if (isUpdated == true) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => ProfileScreen(),
                            ),
                          );
                        }
                      });
                    },
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: ElevatedButton.icon(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.clear();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthLayout(
                        body: const Login(),
                        title: "Đăng nhập",
                        trailing: Login.trailing(context),
                      ),
                    ),
                    (route) =>
                        false, // This ensures all previous routes are removed
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
            )
          ],
        ),
      ),
    );
  }
}
