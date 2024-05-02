import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {

  List<String> skills = ["Java", "Figma", "Flutter"];
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kỹ năng",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: skills.length,
          itemBuilder:  (context, index){
            return Skill(skill: skills[index]);
          }
        ),
      ),
      bottomSheet: Container(
          width: screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          height: 175,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Shadow color
                  spreadRadius: 0,
                  blurRadius: 10, // Shadow blur radius
                  offset: Offset(0, -1),
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Kỹ năng"),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Nhập kỹ năng của bạn"
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  width: screenWidth,
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the border radius
                    ),
                    child: Text("Thêm kỹ năng",
                      style: TextStyle(color: Theme.of(context).colorScheme.background),
                    ),
                  )
              ),
            ],
          )
      ),
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        borderRadius: BorderRadius.circular(15), // Set the border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color with some transparency
            blurRadius: 10, // Blur effect
            spreadRadius: 1, // Spread effect
          ),
        ],
      ),
      child: ListTile(
        title: Text(widget.skill),
        trailing: Transform.translate(
          offset: Offset(0, -5),
          child: GestureDetector(
            onTap: (){},
            child: Text("x",
              style: TextStyle(
                color: Colors.red,
                fontSize: 32,
                fontWeight: FontWeight.w300
              ),
            ),
          ),
        ),
      ),
    );

  }
}

