import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/modules/screens/profile/contacts/contact.dart';
import 'package:fudever_dashboard/modules/screens/profile/favorites/favorites.dart';
import 'package:fudever_dashboard/modules/screens/profile/introduction/introduction.dart';
import 'package:fudever_dashboard/modules/screens/profile/individual_information/individual_information.dart';
import 'package:fudever_dashboard/modules/screens/profile/password/change_password.dart';
import 'package:fudever_dashboard/modules/screens/profile/qrcode_member_card/qrcode_member_card.dart';
import 'package:fudever_dashboard/modules/screens/profile/skills/skill.dart';
import 'package:fudever_dashboard/modules/screens/profile/social_media/social_media.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
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

  PreferredSizeWidget _buildProfileHeader(BuildContext context) {
    return AppBar(
      foregroundColor: Theme.of(context).colorScheme.onBackground,
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){Navigator.pop(context);},
        child: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.onBackground,),
      ),
      title: Text(
        'Hồ sơ cá nhân',
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
      actions: [
        GestureDetector(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context){
            return QrCodeMember();
          }));},
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
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade300,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Transform.translate(
                offset: Offset(-4.5, -5),
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
        ),
      ],
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
              'emaiil@gmail.com',
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
