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

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({
    this.arguments = null,
    data = null,
    super.key,
  });

  final arguments;
  Map<String, dynamic>? data;
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late dynamic data;
  late List<Member>? members;
  late TextEditingController searchBarController = TextEditingController();
  late Timer? _debounce = null;
  User? user;

  late List<Member>? searchMembers;
  void useDebounce(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      if (data != null) {
        searchMembers = List<Member>.from(data!.where((Member element) =>
            element.getFullname().toLowerCase().contains(value.toLowerCase())));
        setState(() {
          members = searchMembers;
        });
      }
    });
  }

  void onSelectMember(BuildContext context, Member member) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ViewMemberScreen(
          member: member,
        ),
      ),
    );
  }

  void onSelectAvatar() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );

    if (result == true) {
      await ApiRepository
          .loadAllAPIs(); // Load lại tất cả các API khi profile được cập nhật
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

  void getData() async {
    data = await UserController.getUsers();

    setState(() {
      data = (data['data']['users'] as List)
          .map((item) => Member.fromJson(item))
          .toList();
      members = [...data];
      if (widget.arguments != null) {
        members = members!.where((Member element) {
          if (widget.arguments['position'] != 'Any' &&
              (element.positionId == null ||
                  element.positionId!['name'] !=
                      widget.arguments['position'])) {
            return false;
          }
          if (widget.arguments['major'] != 'Any' &&
              (element.majorId == null ||
                  element.majorId!['name'] != widget.arguments['major'])) {
            return false;
          }
          if (widget.arguments['department'] != 'Any') {
            bool departmentExists = element.departments!.any((department) =>
                department['name'] == widget.arguments['department']);
            if (!departmentExists) {
              return false;
            }
          }
          if (widget.arguments['gen'] != 'Any' &&
              (element.gen == -1 ||
                  element.gen !=
                      int.parse(widget.arguments['gen']
                          .toString()
                          .characters
                          .last))) {
            return false;
          }
          return true;
        }).toList();
      }
    });
  }

  @override
  void initState() {
    searchBarController.addListener(() {
      useDebounce(searchBarController.text);
    });
    getData();
    // getUserDetail();
    members = null;
    ApiRepository.loadAllAPIs();
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Widget _buildProfileImage(BuildContext context) {
    final Future<String?> userId = IdManager().getId();

    return FutureBuilder(
      future: getUserDetail(userId.toString()),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
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
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (ctx) => const FilterScreen(),
                  //   ),
                  // );
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
                  'assets/images/drawer.svg',
                  // fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          title: Column(
            children: [
              Text(
                'Chào mừng',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              FutureBuilder(
                future: getUserDetail(userId.toString()),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(
                      '${snapshot.data?['firstname']} ${snapshot.data?['lastname']}',
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontSize: 20),
                    );
                  }
                },
              ),
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
          child: Column(
            children: [
              SearchAndFilter(searchBarController: searchBarController),
              const SizedBox(height: 10),
              (members != null)
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.53,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: members!.length,
                        itemBuilder: (context, index) {
                          return MemberGridItem(
                            member: members![index],
                            onSelectMember: () =>
                                onSelectMember(context, members![index]),
                          );
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SvgPicture.asset(
                        'assets/images/filter-no-members.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
