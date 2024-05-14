import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudever_dashboard/models/member.dart';

class MemberGridItem extends StatelessWidget {
  const MemberGridItem({
    super.key,
    required this.member,
    required this.onSelectMember,
  });

  final Member member;
  final void Function() onSelectMember;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectMember,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    member.avatar!,
                    height: 246,
                    width: 168,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(0, 0, 152, 255)
                            .withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Text(
                          "5",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              member.firstname! + member.lastname!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("member"),
          ],
        ),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  const Skill({required this.skill, super.key});
  final String skill;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 16,
        shadowColor: Color.fromARGB(77, 149, 157, 165),
        child: ListTile(
          title: Text(skill),
          trailing: Transform.translate(
            offset: const Offset(0, -5),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "x",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 32,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Social extends StatelessWidget {
  const Social(
      {required this.socialTitle, required this.socialIcon, super.key});
  final String socialTitle;
  final String socialIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 16,
        shadowColor: Color.fromARGB(77, 149, 157, 165),
        child: ListTile(
          leading: CircleAvatar(
            radius: 13,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 11,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(socialIcon),
            ),
          ),
          title: Text(socialTitle),
          trailing: Transform.translate(
            offset: const Offset(0, -5),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "x",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 32,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
