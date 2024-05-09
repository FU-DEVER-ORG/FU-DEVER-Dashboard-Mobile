import 'package:flutter/material.dart';
import 'package:fudever_dashboard/modules/screens/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static Widget trailing(context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bạn đã có tài khoản?   ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          GestureDetector(
            child: Text("Đăng nhập",
                style: Theme.of(context).textTheme.labelSmall),
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LoginForm(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
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

  String? errorEmail;
  TextStyle errorStyle = const TextStyle(color: Colors.red);

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

  void handleSubmission() async {
    setState(() {
      errorEmail = validateEmail(email);
    });
    if (errorEmail == null) {
      //loginUser(email, password, rememberMe);
      Navigator.of(context).pushNamed('/');
    }
  }

  Future<void> forgotPassword(String email) async {
    final url = 'http://api/Auth/sign-up';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'username': email,
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
    return PopScope(
      canPop: false,
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: widget.screenWidth * 0.75,
                  child: const Text(
                    "Đừng lo lắng! Chỉ cần nhập email của bạn và chúng tôi sẽ gửi cho bạn một mật mã để đặt lại mật khẩu của bạn!",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Material(
                elevation: 4,
                shadowColor: Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: (errorEmail == null)
                              ? Colors.white
                              : Theme.of(context).colorScheme.error,
                          width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        const SizedBox(width: 8),
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
              SizedBox(
                width: widget.screenWidth,
                height: 40,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  onPressed: handleSubmission,
                  child: const Text(
                    "Đăng nhập",
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
