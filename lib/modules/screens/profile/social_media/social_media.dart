import 'package:flutter/material.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<SocialMediaScreen> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMediaScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    String dropdownValue = '';
    List<String> internetPlatform = [
      'Facebook',
      'Github',
      'Youtube',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomSheet: Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        height: 300,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -1),
          )
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nền tảng"),
            const SizedBox(height: 10),
            DropdownMenu<String>(
              hintText: 'Chọn nền tảng',
              width: MediaQuery.of(context).size.width - 40,
              initialSelection: dropdownValue,
              onSelected: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries: internetPlatform
                  .map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(height: 10),
            const Text("Link"),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Nhập URL"),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: screenWidth,
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Thêm liên kết",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}