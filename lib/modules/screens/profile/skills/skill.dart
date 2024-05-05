import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          height: 175,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 0,
              blurRadius: 10, // Shadow blur radius
              offset: Offset(0, -1),
            )
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Kỹ năng"),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    hintText: "Nhập kỹ năng của bạn"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: screenWidth,
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the border radius
                    ),
                    child: Text(
                      "Thêm kỹ năng",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background),
                    ),
                  )),
            ],
          )),
    );
  }
}

class Skill extends StatefulWidget {
  const Skill({required this.skill, super.key});
  final String skill;
  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 10,
        shadowColor: Colors.grey.shade200,
        child: ListTile(
          title: Text(widget.skill),
          trailing: Transform.translate(
            offset: Offset(0, -5),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "x",
                style: TextStyle(
                    color: Colors.red, fontSize: 32, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
