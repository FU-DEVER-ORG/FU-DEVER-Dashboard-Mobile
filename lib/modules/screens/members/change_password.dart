import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  late bool obscureCurrentPassword;
  late bool obscureNewPassword;
  late bool obscureVerifiedPassword;

  String currentPassword = '';
  String newPassword = '';
  String v_password = '';

  void handleSubmission() async {
    if (_formKey.currentState!.validate()) {
      //signUp(originalPassword, password);
      Navigator.of(context).pushNamed('/');
    }
  }

  Future<void> signUp(String originalPassword, String password) async {
    final url = 'http://api/Auth/sign-up';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'originalPassword': originalPassword,
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
    obscureCurrentPassword = true;
    obscureNewPassword = true;
    obscureVerifiedPassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Đổi mật khẩu",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Mật khẩu hiện tại"),
            const SizedBox(
              height: 10,
            ),
              TextFormField(
                obscureText: obscureCurrentPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '*********',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.grey, // Customize the eye icon color
                    ),
                    onPressed: () {
                      // Toggle the obscureText value when the eye icon is pressed
                      setState(() {
                        obscureCurrentPassword = !obscureCurrentPassword;
                      });
                    },
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    currentPassword = value!;
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
            const SizedBox(height: 20),
            const Text("Mật khẩu mới"),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: obscureNewPassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Nhập mật khẩu mới',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.visibility,
                    color: Colors.grey, // Customize the eye icon color
                  ),
                  onPressed: () {
                    // Toggle the obscureText value when the eye icon is pressed
                    setState(() {
                      obscureNewPassword = !obscureNewPassword;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  newPassword = value!;
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
            const SizedBox(height: 20),
            const Text("Xác nhận"),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: obscureVerifiedPassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Nhập lại mật khẩu mới',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.visibility,
                    color: Colors.grey, // Customize the eye icon color
                  ),
                  onPressed: () {
                    // Toggle the obscureText value when the eye icon is pressed
                    setState(() {
                      obscureVerifiedPassword = !obscureVerifiedPassword;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  v_password = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a valid password'; // Changed error message
                } else if (!RegExp(r'^[\w]+$').hasMatch(value)) {
                  return 'Enter a valid password'; // Changed error message
                } else if (newPassword != v_password) {
                  return 'Passwords are not the same'; // Changed error message
                } else {
                  return null;
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
