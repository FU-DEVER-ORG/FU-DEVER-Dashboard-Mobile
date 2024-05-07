import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key, required this.title});

  final String title;

  @override
  State<ContactsScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        body: Column(
          children: [
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Text('Email'),
                    const Text(
                      " *",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              subtitle: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Email của bạn',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Text('Số điện thoại'),
                    const Text(
                      " *",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
              subtitle: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Số điện thoại của bạn',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
          ],
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
            child: Container(
              width: screenWidth,
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                color: Theme.of(context).buttonTheme.colorScheme!.primary,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Xác nhận",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
