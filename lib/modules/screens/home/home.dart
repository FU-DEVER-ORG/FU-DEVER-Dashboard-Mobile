import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/models/member.dart';
import 'package:fudever_dashboard/modules/screens/filters/filters.dart';
import 'package:fudever_dashboard/modules/screens/profile/profile.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';

import '../../../data/dummy_data.dart';
import '../members/view_members.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        builder: (context) => ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
          ), // Khoảng cách lề phải là 20px
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            // heroTag: null,
            mini: true,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            elevation: 4,
            child: const Icon(
              Icons.apps_sharp,
              color: Colors.blue,
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
        backgroundColor: Colors.blue.shade50,
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
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SearchAnchor.bar(
                      barHintText: 'Tìm thành viên',
                      viewBackgroundColor: Colors.white,
                      barBackgroundColor:
                          MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Colors.white;
                      }),
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<Widget>.generate(
                          5,
                          (int index) {
                            return ListTile(
                              titleAlignment: ListTileTitleAlignment.center,
                              title: Text('Initial list item $index'),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => FilterScreen(),
                          ),
                        );
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 5.0,
                            offset: const Offset(2.0, 4.0),
                          ),
                        ],
                      ),
                      height: 55,
                      width: 55,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          'assets/images/filter.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.53,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: memberList.length,
                itemBuilder: (context, index) {
                  final member = memberList[index];
                  return MemberGridItem(
                    member: member,
                    onSelectMember: () => onSelectMember(context, member),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
