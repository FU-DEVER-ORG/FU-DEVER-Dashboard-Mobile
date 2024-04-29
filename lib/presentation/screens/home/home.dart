import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudever_dashboard/presentation/screens/members/profile.dart';
import 'package:fudever_dashboard/presentation/widgets/grid_item.dart';

import '../../../data/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onSelectMember() {
    Navigator.of(context).pushNamed('profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shape: CircleBorder(eccentricity: 0.5),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.apps_sharp),
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
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Image.asset('assets/images/Avatar.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SearchAnchor.bar(
                    barHintText: 'Tìm thành viên',
                    viewBackgroundColor: Colors.white,
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
                const SizedBox(width: 5),
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/images/filter-button.svg',
                    height: 100,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(Icons.filter_alt),
                // ),
              ],
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
                    onSelectMember: onSelectMember,
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
