import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/screens/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LoginForm(screenHeight: screenHeight,screenWidth: screenWidth,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bạn đã có tài khoản?   "),
            GestureDetector(
              child: Text("Đăng nhập"),
              onTap: () => Navigator.of(context).pushNamed('login'),
            )
          ],
        )
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({required this.screenWidth, required this.screenHeight,Key? key}) : super(key: key);
  final double screenWidth;
  final double screenHeight;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: widget.screenHeight/2.5,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Material(
              elevation: 3,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Row(
                    children: [
                      Icon(Icons.mail_outline),
                      SizedBox(width: 5,),
                      Text("Nhập email"),
                    ],
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid email';
                  } else if (!RegExp(
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                      .hasMatch(value)) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Material(
              elevation: 3,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                obscureText: obscureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Row(
                    children: [
                      Icon(Icons.lock_open_rounded),
                      SizedBox(width: 5,),
                      Text("Nhập mật khẩu"),
                    ],
                  ),
                  labelStyle: TextStyle(
                      color: Colors.black
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.grey, // Customize the eye icon color
                    ),
                    onPressed: () {
                      // Toggle the obscureText value when the eye icon is pressed
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid password'; // Changed error message
                  } else if (!RegExp(r'^[\w]+$').hasMatch(value)) {
                    return 'Enter a valid password'; // Changed error message
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Material(
              elevation: 3,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                obscureText: obscureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Row(
                    children: [
                      Icon(Icons.lock_open_rounded),
                      SizedBox(width: 5,),
                      Text("Nhập lại mật khẩu"),
                    ],
                  ),
                  labelStyle: TextStyle(
                      color: Colors.black
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.grey, // Customize the eye icon color
                    ),
                    onPressed: () {
                      // Toggle the obscureText value when the eye icon is pressed
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid password'; // Changed error message
                  } else if (!RegExp(r'^[\w]+$').hasMatch(value)) {
                    return 'Enter a valid password'; // Changed error message
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height:20), // Increased space between remember me and Signup button
            Container(
              width: widget.screenWidth,
              height: 40,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/'),
                child: Text("Đăng ký"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
