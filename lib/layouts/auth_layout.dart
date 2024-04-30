import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AuthLayout extends StatefulWidget {
  const AuthLayout({required this.body,required this.title, super.key});

  final Widget body;
  final String title;

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Set status bar color to transparent
      ),
      child:Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
            children: <Widget>[
              Container(
                height: screenHeight/2,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset(
                        'assets/images/plane-background.svg',
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
      ),
    );
  }
}

