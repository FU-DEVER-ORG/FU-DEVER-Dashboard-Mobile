import 'package:flutter/material.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<SocialMediaScreen> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMediaScreen> {
  String dropdownValue = '';
  final List<String> internetPlatform = ['Facebook', 'Github', 'Youtube'];
  final List<List<String>> socials = [
    ['Facebook', 'assets/images/facebook.svg'],
    ['Github', 'assets/images/github.svg'],
    ['Youtube', 'assets/images/youtube.svg']
  ];

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      hintStyle: TextStyle(color: Colors.grey.shade400),
      hintText: hintText,
    );
  }

  Widget buildDropdown() {
    return DropdownMenu<String>(
      trailingIcon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Colors.grey,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color.fromARGB(255, 215, 215, 215), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color.fromARGB(255, 215, 215, 215), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 215, 215, 215),
        ),
      ),
      textStyle: Theme
          .of(context)
          .textTheme
          .bodySmall,
      selectedTrailingIcon: Icon(
        Icons.expand_less,
        color: Theme
            .of(context)
            .iconTheme
            .color,
      ),
      hintText: 'Chọn nền tảng',
      width: MediaQuery
          .of(context)
          .size
          .width - 40,
      initialSelection: dropdownValue,
      onSelected: (value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries:
      internetPlatform.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Theme
                .of(context)
                .colorScheme
                .onBackground),
          ),
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .background,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: internetPlatform.length,
              itemBuilder: (context, index) {
                return Social(socialTitle: socials[index][0],
                  socialIcon: socials[index][1],);
              }),
        ),
        bottomSheet: Wrap(
          children: [
          Container(
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
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
                  const Text("Nền tảng"),
                  const Text(
                    " *",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(height: 10),
              buildDropdown(),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Link"),
                  const Text(
                    " *",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: buildInputDecoration("Nhập URL"),
              ),
              const SizedBox(height: 10),
              Container(
                width: screenWidth,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Thêm liên kết",
                    style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .background,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    ),);
  }
}
