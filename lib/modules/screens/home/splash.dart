import 'package:flutter/material.dart';
import '../auth/login.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/typewriter_animation.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late TextStyle textStyle;
  late int splashDuration;

  @override
  void initState() {
    super.initState();
    textStyle = GoogleFonts.dancingScript(fontSize: 32, color: Colors.white);
    splashDuration = 1200;
    Future.delayed(Duration(milliseconds: splashDuration + 750), () {
      Navigator.of(context).pushNamed('login');
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 153, 255),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth / 2,
              child: Image.asset(
                'assets/images/logo-white-only.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
