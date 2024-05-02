import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/member.dart';

class ViewMemberScreen extends StatefulWidget {
  const ViewMemberScreen({
    Key? key,
    required this.member,
  }) : super(key: key);

  final Member member;

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ViewMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Xem thành viên',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/demo-image.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.member.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.member.role,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [Colors.blue.shade200, Colors.blue]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                            child: Text(
                              widget.member.generation,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.work),
                                Text(widget.member.career),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month),
                                Text(
                                    '${widget.member.birthday.day}/${widget.member.birthday.month}/${widget.member.birthday.year}')
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        _buildSocialMediaContainer(),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text('Email'),
                            const Spacer(),
                            Text(
                              widget.member.email,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Quê quán'),
                            const Spacer(),
                            Text(
                              widget.member.address,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Số điện thoại'),
                            const Spacer(),
                            Text(
                              widget.member.phoneNumber,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sở thích',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _buildHobbiesContainer(widget.member.hobbies),
                        const Text(
                          'Kỹ năng',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _buildSkillsContainer(widget.member.skills),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Giới thiệu',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(widget.member.introduction),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text('Tham gia'),
                            const Spacer(),
                            Text(
                              '${widget.member.joiningDate.year}/${widget.member.joiningDate.month}/${widget.member.joiningDate.day}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Chức vụ'),
                            const Spacer(),
                            Text(
                              widget.member.role,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Ban'),
                            const Spacer(),
                            Text(
                              widget.member.executiveBoard,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Chuyên ngành'),
                            const Spacer(),
                            Text(
                              widget.member.major,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Text('Nơi làm việc'),
                            Spacer(),
                            Text(
                              '...',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHobbiesContainer(List<String> hobbies) {
  return Wrap(
    spacing: 15,
    children: hobbies.map((hobby) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.purple.shade200,
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Text(hobby),
      );
    }).toList(),
  );
}

Widget _buildSkillsContainer(List<String> skills) {
  return Wrap(
    spacing: 5,
    children: skills.map((skill) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.shade200,
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Text(skill),
      );
    }).toList(),
  );
}

Widget _buildSocialMediaContainer() {
  return Row(
    children: [
      Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            'assets/images/facebook.svg',
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            height: 24,
          ),
        ),
      ),
      const SizedBox(width: 12),
      Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            'assets/images/github.svg',
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            height: 24,
          ),
        ),
      ),
      const SizedBox(width: 12),
      Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            'assets/images/youtube.svg',
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            height: 24,
          ),
        ),
      ),
    ],
  );
}
