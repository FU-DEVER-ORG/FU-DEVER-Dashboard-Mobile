import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  String email = '';
  String password = '';
  bool rememberMe = false;

  String? errorEmail;
  String? errorPassword;

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

  void handleSubmission() async {
    setState(() {
    errorEmail = validateEmail(email);
    errorPassword = validatePassword(password);

    });
    if(errorEmail==null &&errorPassword==null){
      //loginUser(email, password, rememberMe);
      Navigator.of(context).pushNamed('/');
    }
  }

  Future<void> loginUser(String email, String password, bool rememberMe) async {
    final url = 'http://api/Auth/sign-in';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'rememberMe': rememberMe,
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
        padding: const EdgeInsets.all(20),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (onChange) {
                          setState(() {
                            rememberMe = onChange!;
                          });
                        },
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
              const SizedBox(height: 20),
              SizedBox(
                width: widget.screenWidth,
                height: 40,
                child: ElevatedButton(
                  onPressed: handleSubmission,
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
      ),
    );
  }
}
