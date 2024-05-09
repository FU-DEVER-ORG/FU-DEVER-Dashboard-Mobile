import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/models/member.dart';
import 'package:fudever_dashboard/modules/screens/filters/filter_screen.dart';
import 'package:fudever_dashboard/modules/screens/profile/profile.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';
import 'package:fudever_dashboard/modules/widgets/search_and_filter.dart';

import '../../../data/dummy_data.dart';
import '../members/view_members.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Member>? data;

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

  dynamic df;
  void getData()async{
    df = await UserController.getUsers();
    print(df);
  }
  @override
  void initState() {
    getData();
    data = memberList;
    super.initState();
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
              const SearchAndFilter(),
              const SizedBox(height: 10),
              (data != null)
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.53,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return MemberGridItem(
                            member: data![index],
                            onSelectMember: () =>
                                onSelectMember(context, data![index]),
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
