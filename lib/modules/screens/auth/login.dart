import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static Widget trailing(context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Bạn chưa có tài khoản?   ", style: Theme.of(context).textTheme.bodySmall,),
          GestureDetector(
            child: Text("Đăng ký", style: Theme.of(context).textTheme.labelSmall),
            onTap: () => Navigator.of(context).pushNamed('signup'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return LoginForm(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
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
  bool rememberMe = false;

  String? errorEmail;
  String? errorPassword;


  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid password'; // Changed error message
    }
    return null;
  }

  void handleSubmission() async {
    setState(() {
      errorEmail = validateEmail(email);
      errorPassword = validatePassword(password);
    });
    if (errorEmail == null && errorPassword == null) {
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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 4,
              shadowColor: Theme.of(context).shadowColor,
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: (errorEmail == null)
                            ? Colors.white
                            : Theme.of(context).colorScheme.error,
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Nhập email",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 100),
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
              padding: const EdgeInsets.all(5.0),
              child: Text(
                (errorEmail == null) ? " " : errorEmail!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
            Material(
              elevation: 4,
              shadowColor: Theme.of(context).shadowColor,
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                obscureText: obscureText,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: (errorPassword == null)
                            ? Colors.white
                            : Theme.of(context).colorScheme.error,
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Row(
                    children: [
                      Icon(
                        Icons.lock_open_rounded,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Nhập mật khẩu",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  suffixIcon: IconButton(
                    icon: obscureText
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: Theme.of(context).iconTheme.color, // Customize the eye icon color
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: Theme.of(context).iconTheme.color, // Customize the eye icon color
                          ),
                    onPressed: () {
                      // Toggle the obscureText value when the eye icon is pressed
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 40),
                onChanged: (value) {
                  setState(() {
                    password = value!;
                    errorPassword = null;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                (errorPassword == null) ? " " : errorPassword!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
            Transform.translate(
              offset: Offset(-5, -20),
              child: Row(
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
                    child: Text(
                      "Quên mật khẩu?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -10),
              child: SizedBox(
                width: widget.screenWidth,
                height: 40,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  onPressed: handleSubmission,
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(color: Colors.white),
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
