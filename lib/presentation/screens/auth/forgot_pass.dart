import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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

  String email = '';

  void handleSubmission()async {
    if (_formKey.currentState!.validate()){
      //forgotPassword(email);
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
    return Form(
      key: _formKey,
      child: Container(
        height: widget.screenHeight/2.5,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Container(
              width: widget.screenWidth*0.8,
              child: Text(
                "Đừng lo lắng! Chỉ cần nhập email của bạn và chúng tôi sẽ gửi cho bạn một mật mã để đặt lại mật khẩu của bạn!",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30,),
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
            Container(
              width: widget.screenWidth,
              height: 40,
              child: ElevatedButton(
                onPressed: handleSubmission,
                child: Text("Lấy lại mật khẩu"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
