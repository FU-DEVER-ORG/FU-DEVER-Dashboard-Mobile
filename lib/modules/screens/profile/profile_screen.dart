import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/controller/profile_controller.dart';
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
import 'package:fudever_dashboard/provider/token_provider.dart';
import 'package:fudever_dashboard/utils/custom_dialog.dart';


// ignore: must_be_immutable
class ProfileScreen extends ConsumerStatefulWidget {
  ProfileScreen({
    Key? key,
    data,
  }) : super(key: key);

  Map<String, dynamic>? data;
  @override
  ConsumerState<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<ProfileScreen> {
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
              setState(() {});
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

  Widget _buildHeaderProfile(BuildContext context) {
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
                    snapshot.data?['avatar'];
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

  Widget _buildProfileBody(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getUserDetail(),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
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
              return _buildListTile(item['icon'], item['title'], () async {
                // Await the navigation and capture the result.
                bool? isUpdated = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => item['screen'],
                  ),
                );
                if (isUpdated == true) {
                  // ignore: use_build_context_synchronously
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
            _buildHeaderProfile(context),
            const SizedBox(height: 20),
            _buildProfileBody(context),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: ElevatedButton.icon(
                onPressed: () async {
                  CustomDialog.showCustomDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    title: 'Đăng xuất',
                    content: 'Bạn chắc chắn muốn đăng xuất không?',
                    cancelButton: 'Quay lại',
                    acceptButton: 'Đăng xuất',
                    onPressedCheck: () async {
                      final tokenManager = TokenNotifier();
                      await tokenManager.clearToken();

                      ProfileController.clearProfile();
                      // final SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // await prefs.clear();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthLayout(
                            body: const Login(),
                            title: "Đăng nhập",
                            trailing: Login.trailing(context),
                          ),
                        ),
                        (route) => false,
                      );
                    },
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
}
