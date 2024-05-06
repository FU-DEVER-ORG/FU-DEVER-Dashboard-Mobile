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
        body: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Text('Email'),
                  const Text("*", style: TextStyle(color: Colors.red),)
                ],
              ),
              subtitle: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Email của bạn',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text('Số điện thoại'),
                  const Text("*", style: TextStyle(color: Colors.red),)
                ],
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Số điện thoại của bạn',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 89,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 3.0,
                blurRadius: 5.0,
                offset: const Offset(2.0, 4.0),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 30),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fixedSize: const Size(160, 20),
              ),
              child: const Text('Xác nhận'),
            ),
          ),
        ),
      ),
    );
  }
}
