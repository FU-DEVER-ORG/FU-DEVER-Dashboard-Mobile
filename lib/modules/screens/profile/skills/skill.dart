import 'package:flutter/material.dart';
import 'package:fudever_dashboard/modules/widgets/custom_text_fields.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SkillsScreen> createState() => _SkillsState();
}

class _SkillsState extends State<SkillsScreen> {
  List<String> skills = ["Java", "Figma", "Flutter"];

  TextEditingController skillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;
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
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.onBackground,),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return Skill(skill: skills[index]);
              }),
        ),
        bottomSheet: Container(
            width: screenWidth,
            padding: EdgeInsets.fromLTRB(20, 8,20,24),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(51), // Shadow color
                spreadRadius: 0,
                blurRadius: 24, // Shadow blur radius
                offset: Offset(0, -1),
              )
            ]),
            child: Wrap(
              spacing: 8,
                children: [
                  CustomField(title: "Kỹ năng", hintText: "Nhập kỹ năng của bạn", controller: skillController, isCompulsory: true),
                  Container(
                      padding: EdgeInsets.only(top:16),
                      width: screenWidth,
                      child: MaterialButton(
                        color: Theme.of(context).buttonTheme.colorScheme!.primary,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the border radius
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            "Thêm kỹ năng",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.background),
                          ),
                        ),
                      )
                  ),
                ],
              ),
        ),
      ),
    );
  }
}

