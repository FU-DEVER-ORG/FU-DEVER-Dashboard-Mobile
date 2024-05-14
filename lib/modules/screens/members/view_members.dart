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
      backgroundColor: Color.fromARGB(255, 243, 249, 253),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Xem thành viên',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new),
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
                //TODO Tạo bóng cho image
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 154, 39, 39)
                            .withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/demo-image.png',
                    fit: BoxFit.cover,
                  ),
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
                              widget.member.firstname!+widget.member.lastname!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.member.positionId!,
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
                              "gen 5",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.work),
                                const SizedBox(width: 8),
                                Text(widget.member.job!),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month),
                                const SizedBox(width: 8),
                                // Text('${widget.member.dob!.day}/${widget.member.dob!.month}/${widget.member.dob!.year}')
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        _buildSocialMediaContainer(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text('Email'),
                            const Spacer(),
                            Text(
                              widget.member.email!,
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
                              widget.member.hometown!,
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
                              widget.member.phone!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
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
                        const SizedBox(height: 8),
                        Center(
                          child: _buildHobbiesContainer(widget.member.favourites!),
                        ),
                        const Text(
                          'Kỹ năng',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: _buildSkillsContainer(widget.member.skills!),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
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
                        Text(widget.member.description!),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text('Tham gia'),
                            const Spacer(),
                            // Text(
                            //   '${widget.member.dateJoin!.year}/${widget.member.dateJoin!.month}/${widget.member.dateJoin!.day}',
                            //   style: const TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Chức vụ'),
                            const Spacer(),
                            Text(
                              widget.member.positionId!,
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
                              widget.member.job!,
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
                              widget.member.majorId!,
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

Widget _buildHobbiesContainer(List<String?> hobbies) {
  return Wrap(
    spacing: 15,
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: hobbies.map((hobby) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.purple.shade100,
        ),
        margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Text(
          hobby!,
          style: TextStyle(
            color: Colors.purple.shade800,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    }).toList(),
  );
}

Widget _buildSkillsContainer(List<String?> skills) {
  return Wrap(
    spacing: 5,
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: skills.map((skill) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.green.shade100,
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Text(
          skill!,
          style: TextStyle(
            color: Colors.green.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      const SizedBox(width: 8),
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
      const SizedBox(width: 8),
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
