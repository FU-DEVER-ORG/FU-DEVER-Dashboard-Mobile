import 'package:flutter/material.dart';
import 'package:fudever_dashboard/modules/screens/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        LoginForm(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
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

  String email = '';
  String password = '';
  String v_password = '';

  void handleSubmission()async {
    if (_formKey.currentState!.validate()){
      //signUp(email, password);
      Navigator.of(context).pushNamed('/');
    }
  }
  Future<void> signUp(String email, String password) async {
    final url = 'http://api/Auth/sign-up';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Successful login
      final responseData = jsonDecode(response.body);
      print(responseData);
    } else {
      // Error handling
      print('Login failed. Status code: ${response.statusCode}');
    }
  }


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
        height: widget.screenHeight / 2.2,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
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
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
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
                onChanged: (value){
                  setState(() {
                    email = value!;
                  });
                },
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
              const SizedBox(height: 20),
              TextFormField(
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
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
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
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
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
              const SizedBox(height: 10),
              TextFormField(
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
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Row(
                    children: [
                      Icon(Icons.lock_open_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Nhập lại mật khẩu"),
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
                onChanged: (value){
                  setState(() {
                    v_password = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid password'; // Changed error message
                  } else if (!RegExp(r'^[\w]+$').hasMatch(value)) {
                    return 'Enter a valid password'; // Changed error message
                  }else if (password !=v_password) {
                    return 'Passwords are not the same'; // Changed error message
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                  height:
                      20), // Increased space between remember me and Signup button
              SizedBox(
                width: widget.screenWidth,
                height: 40,
                child: ElevatedButton(
                  onPressed: handleSubmission,
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
