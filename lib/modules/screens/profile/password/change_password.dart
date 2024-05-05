import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordScreen> {
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Đổi mật khẩu",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.onBackground,),
        ),
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
                Row(
                  children: [
                    const Text("Mật khẩu hiện tại"),
                    const Text("*", style: TextStyle(color: Colors.red),)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: obscureCurrentPassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: '**********',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: IconButton(
                      icon: obscureCurrentPassword
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
                Row(
                  children: [
                    const Text("Mật khẩu mới"),
                    const Text("*", style: TextStyle(color: Colors.red),)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: obscureNewPassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Nhập mật khẩu mới',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: IconButton(
                      icon: obscureNewPassword
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
                          obscureNewPassword = !obscureNewPassword;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newPassword= value!;
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
                Row(
                  children: [
                    const Text("Xác nhận"),
                    const Text("*", style: TextStyle(color: Colors.red),)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: obscureVerifiedPassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Nhập lại mật khẩu mới',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: IconButton(
                      icon: obscureVerifiedPassword
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
      bottomSheet: Container(
          width: screenWidth,
          padding: EdgeInsets.only(bottom: 24, top: 8, left: 16, right: 16),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 0,
              blurRadius: 10, // Shadow blur radius
              offset: Offset(0, -1),
            )
          ]),
          height: 75,
          child: Container(
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust the border radius
                ),
                child: Text(
                  "Xác nhận",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background),
                ),
              ))),
    );
  }
}
