import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/models/member.dart';
import 'package:fudever_dashboard/models/user.dart';
import 'package:fudever_dashboard/modules/screens/filters/filter_screen.dart';
import 'package:fudever_dashboard/modules/screens/profile/profile_screen.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';
import 'package:fudever_dashboard/modules/widgets/search_and_filter.dart';

import 'dart:async';
import '../../../api/api_repository.dart';
import '../../../controller/id_manager.dart';
import '../../../provider/image_provider.dart';
import '../members/view_members.dart';

class ActivityScreen extends ConsumerStatefulWidget {
  ActivityScreen({
    this.arguments = null,
    super.key,
    this.data,
  });

  final arguments;
  Map<String, dynamic>? data;
  @override
  ConsumerState<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {
  late dynamic data;
  late List<Member>? members;
  late TextEditingController searchBarController = TextEditingController();
  late Timer? _debounce = null;
  User? user;
  late List<Map<String, dynamic>> activities = [
    {
      "title": "Leetcode",
      "icon": "points.png",
      "uri": "leader-board"
    },
    {
      "title": "Điểm hoạt động",
      "icon": "activity-points.png",
      "uri": "on-work"
    },
    {
      "title": "Nộp quỹ",
      "icon": "fund.png",
      "uri": "on-work"
    },
    {
      "title": "Ghép đôi",
      "icon": "pairing.png",
      "uri": "on-work"
    },
    {
      "title": "Lịch sử CLB",
      "icon": "history.png",
      "uri": "on-work"
    },
  ];


  void getData() async {
    if (widget.arguments != null){
      data = await UserController.filterUsers(filter:widget.arguments);
    }else{
      data = await UserController.getUsers();
    }

    setState(() {
      data = (data['data']['users'] as List)
          .map((item) => Member.fromJson(item))
          .toList();
      members = [...data];
    });
  }



  void onSelectAvatar() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );

    if (result == true) {
      // await ApiRepository
      //     .loadAllAPIs(); // Load lại tất cả các API khi profile được cập nhật
      getData(); // Load lại dữ liệu từ API liên quan đến người dùng
    }
  }

  Future<Map<String, dynamic>> getUserDetail(String userId) async {
    if (widget.data == null) {
      dynamic response = await UserController.getUserDetail();
      return response['data'];
    }
    return widget.data!['data'];
  }

  Widget _buildProfileImage(BuildContext context) {
    final Future<String?> userId = IdManager().getId();

    return FutureBuilder(
      future: getUserDetail(userId.toString()),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircleAvatar(
            backgroundImage: NetworkImage(snapshot.data!['avatar']),
            radius: 20.0, // Adjust the radius as needed
          );
        }
      },
    );
  }

  @override
  void initState() {
    getData();
    // getUserDetail();
    ApiRepository.loadAllAPIs();
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final File? userAvatar = ref.watch(userImageProvider);
    final Future<String?> userId = IdManager().getId();

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 249, 253),
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 149, 157, 165)
                          .withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 24.0,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/images/Home_Drawer.svg',
                  // fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          title: Column(
            children: [
              Text(
                'FU-DEVER',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              Text("Tiện ích câu lạc bộ", style: TextStyle(color: Colors.black),)
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 243, 249, 253),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: onSelectAvatar,
                child: userAvatar != null
                    ? CircleAvatar(
                  backgroundImage: FileImage(userAvatar),
                )
                    : _buildProfileImage(context),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: activities.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0
            ),
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(activities[index]['uri']);
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.black,
                      child: Image.asset(
                        "assets/images/${activities[index]['icon']}",
                        height: 45,
                        width: 45,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(activities[index]['title'])
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
