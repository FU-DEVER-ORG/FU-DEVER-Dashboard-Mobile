import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AuthLayout extends StatefulWidget {
  const AuthLayout({required this.body,required this.title, required this.trailing, super.key});

  final Widget body;
  final String title;
  final Widget trailing;

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {

  Color handleStatusBar() {
    if (kIsWeb) {
      // Specific code for web
      return Color.fromARGB(255, 0, 123, 255);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      // Specific code for iOS
      return Colors.transparent;
    } else {
      // Default code for other platforms (e.g., Android)
      return Color.fromARGB(255, 0, 123, 255);
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: handleStatusBar(),
      ),
      child:GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
          body: ListView(
              children: <Widget>[
                Container(
                  height: screenHeight*((screenHeight>720)?0.49:0.42),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/plane-background.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                widget.body
              ]
          ),
          bottomNavigationBar: widget.trailing,
        ),
      ),
    );
  }
}

