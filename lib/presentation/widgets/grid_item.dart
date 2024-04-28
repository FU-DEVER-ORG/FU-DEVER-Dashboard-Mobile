import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/models/member.dart';

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
                    member.imageAssetPath,
                    height: 250,
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
                          member.generation,
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
              member.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(member.role),
          ],
        ),
      ),
    );
  }
}
