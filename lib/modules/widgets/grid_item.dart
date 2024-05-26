import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudever_dashboard/models/member.dart';

import '../../provider/image_provider.dart';

class MemberGridItem extends ConsumerStatefulWidget {
  const MemberGridItem({
    super.key,
    required this.member,
    required this.onSelectMember,
  });

  final Member member;
  final void Function() onSelectMember;

  @override
  ConsumerState<MemberGridItem> createState() => _MemberGridItemState();
}

class _MemberGridItemState extends ConsumerState<MemberGridItem> {
  @override
  Widget build(BuildContext context) {
    final avatarUrl = ref.watch(userImageProvider);

    return InkWell(
      onTap: widget.onSelectMember,
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
                  Image.network(
                    widget.member.avatar!,
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
                          widget.member.gen == null
                              ? 'Gen ?'
                              : 'Gen ${widget.member.gen}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: AutoSizeText(
                "${widget.member.firstname!} ${widget.member.lastname!}",
                style: const TextStyle(fontWeight: FontWeight.bold),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                minFontSize: 10, // minimum font size to fit the text
              ),
            ),
            Text(widget.member.positionId == null
                ? 'Chưa rõ'
                : widget.member.positionId!['name']),
          ],
        ),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  const Skill({required this.skill, required this.onDelete, super.key});

  final String skill;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 16,
        shadowColor: const Color.fromARGB(77, 149, 157, 165),
        child: ListTile(
          title: Text(skill),
          trailing: Transform.translate(
            offset: const Offset(0, -5),
            child: GestureDetector(
              onTap: onDelete,
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
      {required this.onDelete,
      required this.socialTitle,
      required this.socialIcon,
      super.key});
  final String socialTitle;
  final String socialIcon;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 16,
        shadowColor: const Color.fromARGB(77, 149, 157, 165),
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
          title: GestureDetector(
            child: Text(socialTitle),
            onTap: () {},
          ),
          trailing: Transform.translate(
            offset: const Offset(0, -5),
            child: GestureDetector(
              onTap: onDelete,
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

class TopLeaders extends StatefulWidget {
  const TopLeaders({super.key, this.isCenter=true});
  final bool isCenter;

  @override
  State<TopLeaders> createState() => _TopLeadersState();
}

class _TopLeadersState extends State<TopLeaders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: (widget.isCenter)?MainAxisAlignment.center:MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 24,),
        Stack(
          children: [
            CircleAvatar(
              radius: 39,
              backgroundColor: Colors.blue,
              child: Image.asset(
                "assets/images/Avatar.png",
                fit: BoxFit.contain,
                height: 74,
                width: 74,
              ),
            ),
            (!widget.isCenter)
                ?
            Transform.translate(
              offset: Offset(24,-20),
              child: SvgPicture.asset("assets/images/crown.svg")
            )
                :
            Container(),
            Transform.translate(
              offset: Offset(26,65),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
                child: Text(
                  "2",
                ),
              ),
            )
          ]
        ),
        SizedBox(height: 20,),
        Container(
          width: 90,
          child: Text(
            "Tamara Schmidt Thang",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 8,
              child: Image.asset(
                "assets/images/points.png",
                height: 10,
                width: 10,
              ),
            ),
            SizedBox(width: 4,),
            Text("40 pts"),
          ],
        )
      ],
    );
  }
}
