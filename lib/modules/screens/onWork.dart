import 'package:flutter/material.dart';

class OnWork extends StatefulWidget {
  const OnWork({
    super.key,
  });


  @override
  State<OnWork> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<OnWork> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "OnWork",
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        body:Container(
          child: Center(
            child: Text("Trong quá trình phát triển"),
          ),
        ),
      ),
    );
  }
}
