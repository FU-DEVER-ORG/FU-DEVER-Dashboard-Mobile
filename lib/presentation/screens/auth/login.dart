import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LoginForm(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bạn chưa có tài khoản?   "),
              GestureDetector(
                child: const Text("Đăng ký"),
                onTap: () => Navigator.of(context).pushNamed('signup'),
              )
            ],
          )
        ]);
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm(
      {required this.screenWidth, required this.screenHeight, Key? key})
      : super(key: key);
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
        height: widget.screenHeight / 2.5,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Material(
              elevation: 3,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Row(
                    children: [
                      Icon(Icons.mail_outline),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Nhập email"),
                    ],
                  ),
                  labelStyle: const TextStyle(color: Colors.black),
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
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Row(
                    children: [
                      Icon(Icons.lock_open_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Nhập mật khẩu"),
                    ],
                  ),
                  labelStyle: const TextStyle(color: Colors.black),
                  suffixIcon: IconButton(
                    icon: const Icon(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (isChecked) {},
                    ),
                    const Text("Nhớ mật khẩu"),
                  ],
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed('forgot-password'),
                  child: const Text("Quên mật khẩu?"),
                )
              ],
            ),
            const SizedBox(
                height:
                    20), // Increased space between remember me and login button
            SizedBox(
              width: widget.screenWidth,
              height: 40,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/'),
                child: const Text(
                  "Đăng nhập",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
