import 'package:flutter/material.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<FavoritesScreen> createState() => _SkillsState();
}

class _SkillsState extends State<FavoritesScreen> {
  List<String> skills = ["Đá bóng", "Lập trình", "Chơi game"];
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
          leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.onBackground,),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return Skill(skill: skills[index]);
              }),
        ),
        bottomSheet: Wrap(
          children: [
            Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(20, 8,20,24),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(51), // Shadow color
                    spreadRadius: 0,
                    blurRadius: 24, // Shadow blur radius
                    offset: Offset(0, -1),
                  )
                ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Sở thích"),
                      const Text(" *", style: TextStyle(color: Colors.red),)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 215, 215, 215), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Nhập sở thích của bạn",
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 215, 215, 215),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: screenWidth,
                      height: 52,
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the border radius
                        ),
                        child: Text(
                          "Thêm sở thích",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background),
                        ),
                      )),
                ],
              )),
        ]),
      ),
    );
  }
}
