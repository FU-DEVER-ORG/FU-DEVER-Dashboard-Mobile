import 'package:flutter/material.dart';
import 'package:fudever_dashboard/modules/screens/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);
  static Widget trailing(context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Bạn đã có tài khoản?   ", style: Theme.of(context).textTheme.bodySmall,),
          GestureDetector(
            child: Text("Đăng nhập", style: Theme.of(context).textTheme.labelSmall),
            onTap: () => Navigator.of(context).pushNamed('login'),
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
    return Container(
      padding: const EdgeInsets.all(20),

      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 4,
              shadowColor: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
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
              shadowColor: Colors.grey.shade100,
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
            Material(
              elevation: 4,
              shadowColor: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                obscureText: obscureVerification,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: (errorVpassword == null)
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
                    icon: obscureVerification
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
                        obscureVerification = !obscureVerification;
                      });
                    },
                  ),
                ),
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 40),
                onChanged: (value) {
                  setState(() {
                    password = value!;
                    errorVpassword = null;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                (errorVpassword == null) ? " " : errorVpassword!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
            SizedBox(
              width: widget.screenWidth,
              height: 40,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
                onPressed: handleSubmission,
                child: Text(
                  "Đăng ký",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
