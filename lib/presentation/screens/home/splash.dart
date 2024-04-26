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
    textStyle =
        GoogleFonts.dancingScript(fontSize: 32, color: Colors.white);
    splashDuration = 1200;
    Future.delayed(Duration(milliseconds: splashDuration + 750), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const Login();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 153, 255),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth/2,
              height: screenHeight/2.51,
              child: Image.asset(
                'assets/images/fu-dever-logo-white.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: (screenWidth/5)-60),
              child: TypewriterAnimation(
                text: "Work Hard",
                textStyle: textStyle,
                duration: splashDuration,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: (screenWidth/5)+40, top: 10),
              child: TypewriterAnimation(
                text: "Play Hard",
                textStyle: textStyle,
                duration: splashDuration,
              ),
            )
          ],
        ),
      ),
    );
  }
}
