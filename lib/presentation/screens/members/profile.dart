import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Profile Screen'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Column(
            children: [
              HeaderImage(),
              CardOne(),
              CardTwo(),
              CardThree(),
              CardFour(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Image.asset(
        'assets/images/demo-image.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class CardOne extends StatefulWidget {
  const CardOne({super.key});

  @override
  State<CardOne> createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Row(
            children: [
              Column(
                children: [
                  Text('Name'),
                  Text('Role'),
                ],
              ),
              Spacer(),
              Text('Generation')
            ],
          ),
          Row(
            children: [
              const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text('Job Role'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month),
                      Text('Birthday'),
                    ],
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/images/facebook-icon.svg',
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/images/github-icon.svg',
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/images/youtube-icon.svg',
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
          Container(
            child: const Column(
              children: [
                Row(
                  children: [
                    Text('Email'),
                    Spacer(),
                    Text('...'),
                  ],
                ),
                Row(
                  children: [
                    Text('Quê quán'),
                    Spacer(),
                    Text('...'),
                  ],
                ),
                Row(
                  children: [
                    Text('Số điện thoại'),
                    Spacer(),
                    Text('...'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardTwo extends StatefulWidget {
  const CardTwo({super.key});

  @override
  State<CardTwo> createState() => _CardTwoState();
}

class _CardTwoState extends State<CardTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Sở thích'),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.purple.shade100),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              '',
              style: TextStyle(color: Colors.purple.shade800),
            ),
          ),
        ),
      ],
    );
  }
}

class CardThree extends StatefulWidget {
  const CardThree({super.key});

  @override
  State<CardThree> createState() => _CardThreeState();
}

class _CardThreeState extends State<CardThree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Kỹ năng'),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green.shade100),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              '',
              style: TextStyle(color: Colors.green.shade800),
            ),
          ),
        ),
      ],
    );
  }
}

class CardFour extends StatefulWidget {
  const CardFour({super.key});

  @override
  State<CardFour> createState() => _CardFourState();
}

class _CardFourState extends State<CardFour> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Giới thiệu'),
        SizedBox(height: 10),
        Text(
            'Dedicated, passionate, and accomplished Full Stack Developer with 9+ years of progressive experience working as an Independent Contractor for Google and developing and growing my educational social network that helps others learn programming, web design, game development, networking.\n Aside from my job, I like to create and contribute to open source projects. That helps me to learn a ton of new stuff, grow as a developer and support other open source projects.'),
        Row(
          children: [
            Text('Tham gia'),
            Spacer(),
            Text('... tháng ... năm ...'),
          ],
        ),
        Row(
          children: [
            Text('Chức vụ'),
            Spacer(),
            Text('...'),
          ],
        ),
        Row(
          children: [
            Text('Ban'),
            Spacer(),
            Text(''),
          ],
        ),
        Row(
          children: [
            Text('Chuyên ngành'),
            Spacer(),
            Text(''),
          ],
        ),
        Row(
          children: [
            Text('Nơi làm việc'),
            Spacer(),
            Text('... tháng ... năm ...'),
          ],
        ),
      ],
    );
  }
}
