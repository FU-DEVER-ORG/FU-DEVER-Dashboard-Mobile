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
  late bool obscureVerification;

  String email = '';
  String password = '';
  String vpassword = '';


  String? errorEmail;
  String? errorPassword;
  String? errorVpassword;

  TextStyle errorStyle = TextStyle(color: Colors.red);

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid email';
    } else if (!RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }
  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid password'; // Changed error message
    } else if (!RegExp(r'^[\w]+$').hasMatch(value)) {
      return 'Enter a valid password'; // Changed error message
    }
    return null;
  }
  String? verifyPasswords() {
    if (password!=vpassword){
      return 'Passwords are not the same';
    }
    return null;
  }

  void handleSubmission() async {
    setState(() {
      errorEmail = validateEmail(email);
      errorPassword = validatePassword(password);
      errorVpassword = validatePassword(vpassword);
      errorVpassword = verifyPasswords();
    });
    if(errorEmail==null &&errorPassword==null && errorVpassword==null){
      //loginUser(email, password, rememberMe);
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
    obscureVerification = true;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Material(
                elevation: 5,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: (errorEmail==null)?Colors.white:Colors.red, width: 2),
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
                  onChanged: (value) {
                    setState(() {
                      email = value!;
                      errorEmail = null;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (errorEmail==null) ? " " : errorEmail!,
                  style: errorStyle,
                ),
              ),
              Material(
                elevation: 5,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: (errorPassword==null)?Colors.white:Colors.red, width: 2),
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
                  onChanged: (value) {
                    setState(() {
                      password = value!;
                      errorPassword = null;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (errorPassword==null) ? " " : errorPassword!,
                  style: errorStyle,
                ),
              ),
              Material(
                elevation: 5,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  obscureText: obscureVerification,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: (errorVpassword==null)?Colors.white:Colors.red, width: 2),
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
                          obscureVerification = !obscureVerification;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      vpassword = value!;
                      errorVpassword = null;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (errorVpassword==null) ? " " : errorVpassword!,
                  style: errorStyle,
                ),
              ),
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
