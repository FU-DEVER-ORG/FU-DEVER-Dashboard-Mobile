import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/modules/screens/profile/profile_screen.dart';
import 'package:fudever_dashboard/modules/widgets/custom_text_fields.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final List<dynamic> data;


  @override
  State<SocialMediaScreen> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMediaScreen> {
  String dropdownValue = '';
  TextEditingController urlController = TextEditingController();
  final List<String> internetPlatform = ['Facebook',
      'Github',
      'Youtube'];
  late List<Map<String, String>> socials = [];
  final Map<String, String> constants =
  {'Facebook': 'assets/images/facebook.svg',
  'Github': 'assets/images/github.svg',
  'Youtube': 'assets/images/youtube.svg'};
  final Map<String, String> socialId =
  {'Facebook': '6640f2d6c4bfe1b448687835',
  'Github': '6649687815c7acb7ca2eaa16',
  'Youtube': '6649685f15c7acb7ca2eaa09'};

  void handleSubmit()async{
    if(dropdownValue.isNotEmpty && urlController.text.isNotEmpty){
      Map<String, dynamic> updatedSocials = {
        "socials": [
          for(dynamic element in widget.data){
            "url" : element['url'],
            "socialId":element["socialId"]['_id']
          },
          {
              "url": urlController.text,
              "socialId": socialId[dropdownValue]
          }
        ],
      };
      dynamic response = await UserController.editUsers(options: updatedSocials);
      if(response['status'] == 'success'){
        Navigator.of(context).pop(true);
      }
    }
  }

  void deleteSkill(int index) {
    setState(() {
      widget.data.removeAt(index);
      socials = [
        for (var social in widget.data)
          {
            "url": social['url'],
            "name": social['socialId']['name'],
          }
      ];
    });
  }

  @override
  void initState() {
    if(widget.data!=null){
      socials = [
        for (var social in widget.data)
          {
            "url": social['url'],
            "name": social['socialId']['name'],
          }
      ];
    }else {
      socials = [];
    }
    super.initState();
  }


  Widget buildDropdown(sheetcontext) {
    return DropdownMenu<String>(
      trailingIcon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Colors.grey,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color.fromARGB(255, 215, 215, 215), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color.fromARGB(255, 215, 215, 215), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 215, 215, 215),
        ),
        hintStyle: TextStyle(color: Color.fromARGB(255, 215, 215, 215))
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
          .of(sheetcontext)
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
              Navigator.of(context).pop(false);
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
              itemCount: socials.length,
              itemBuilder: (context, index) {
                return Social(socialTitle: socials[index]['name']!,
                  socialIcon: constants[socials[index]['name']!]!,onDelete: () {
                    deleteSkill(index);
                  },
                );
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
              buildDropdown(context),
              const SizedBox(height: 10),
              CustomField(title: "Link", hintText: "Nhập URl", controller: urlController, isCompulsory: true),
              const SizedBox(height: 10),
              Container(
                width: screenWidth,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  onPressed: handleSubmit,
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
