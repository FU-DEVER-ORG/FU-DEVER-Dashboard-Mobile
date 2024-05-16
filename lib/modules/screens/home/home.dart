import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/models/member.dart';
import 'package:fudever_dashboard/modules/screens/filters/filter_screen.dart';
import 'package:fudever_dashboard/modules/screens/profile/profile.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';
import 'package:fudever_dashboard/modules/widgets/search_and_filter.dart';

import 'dart:async';
import '../members/view_members.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({this.arguments=null, super.key});

  final arguments;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late dynamic data;
  late List<Member>? members;
  late TextEditingController searchBarController = TextEditingController();
  late Timer? _debounce = null;

  late List<Member>? searchMembers;
  void useDebounce(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      if (data != null) {
        searchMembers = List<Member>.from(
            data!.where((Member element) =>
                element.getFullname().toLowerCase().contains(value.toLowerCase())
            )
        );
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

  void onSelectAvatar() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  void getData() async {
    data = await UserController.getUsers();
    setState(() {
      data = (data['data']['users'] as List).map((item) => Member.fromJson(item)).toList();
      members = [...data];
      if(widget.arguments != null){
        members = members!.where((Member element){
          // print('${element.positionId!['name']}, ${element.majorId!['name']}, ${element.departmentId!['name']}, ${element.getGen()}');
          if(widget.arguments['position']!='Any'&&(element.positionId== null
              || element.positionId!['name'] != widget.arguments['position'])){
              return false;
          }
          if(widget.arguments['major']!='Any'&&(element.majorId== null
              || element.majorId!['name'] != widget.arguments['major'])){
              return false;
          }
          if(widget.arguments['department']!='Any'&&(element.departmentId== null
              || element.departmentId!['name'] != widget.arguments['department'])){
              return false;
          }
          if(widget.arguments['gen']!='Any'&&(element.getGen()== "noGen"
              || element.getGen() != widget.arguments['gen'])){
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
    members = null;
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                // width: 100,
                // height: 100,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,

                  // borderRadius: BorderRadius.circular(100),
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
              Text(
                'Developer',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 20),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 243, 249, 253),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: onSelectAvatar,
                child: Image.asset('assets/images/Avatar.png'),
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
