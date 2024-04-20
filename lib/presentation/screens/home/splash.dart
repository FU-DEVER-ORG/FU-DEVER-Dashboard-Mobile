import 'package:flutter/material.dart';
import '../login/login.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/typewriter_animation.dart';
import 'home.dart';

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
    textStyle = GoogleFonts.dancingScript(
        fontSize: 32,
        color: Colors.blueAccent
    );
    splashDuration = 1000;
    Future.delayed(Duration(milliseconds: splashDuration+750),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo-only.png', height: 190,),
            SizedBox(height: 30,),
            TypewriterAnimation(text:"Work Hard",textStyle:textStyle,duration: splashDuration,),
            Padding(
                padding: EdgeInsets.only(left: 70,top: 10),
                child: TypewriterAnimation(text:"Play Hard",textStyle:textStyle,duration: splashDuration,),
            )
          ],
        ),
      ),
    );
  }
}
