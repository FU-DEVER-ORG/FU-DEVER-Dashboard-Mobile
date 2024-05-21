import 'package:flutter/material.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/modules/screens/profile/profile_screen.dart';
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
    if(_formKey.currentState?.validate() ?? false){
      Map<String, dynamic> updatedPassword = {
        "oldPassword" : currentPassword,
        "newPassword" : newPassword
      };
      dynamic response = await UserController.changePassword(options: updatedPassword);
      if(response['status'] == 'success'){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(data: response['data'],),
          ),
        );
      }else{
        print(response);
      }
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical:20, horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Mật khẩu hiện tại"),
                      const Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      )
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 215, 215, 215),
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 215, 215, 215),
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 215, 215, 215)),
                      hintText: '**********',
                      suffixIcon: IconButton(
                        icon: obscureCurrentPassword
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: Theme.of(context)
                                    .iconTheme
                                    .color, // Customize the eye icon color
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                color: Theme.of(context)
                                    .iconTheme
                                    .color, // Customize the eye icon color
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
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text("Mật khẩu mới"),
                      const Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      )
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 215, 215, 215),
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 215, 215, 215),
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 215, 215, 215)),
                      hintText: 'Nhập mật khẩu mới',
                      suffixIcon: IconButton(
                        icon: obscureNewPassword
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: Theme.of(context)
                                    .iconTheme
                                    .color, // Customize the eye icon color
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                color: Theme.of(context)
                                    .iconTheme
                                    .color, // Customize the eye icon color
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
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text("Xác nhận"),
                      const Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      )
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 215, 215, 215),
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 215, 215, 215),
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 215, 215, 215)),
                      hintText: 'Nhập lại mật khẩu mới',
                      suffixIcon: IconButton(
                        icon: obscureVerifiedPassword
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: Theme.of(context)
                                    .iconTheme
                                    .color, // Customize the eye icon color
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                color: Theme.of(context)
                                    .iconTheme
                                    .color, // Customize the eye icon color
                              ),
                        onPressed: () {
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
        bottomSheet: Wrap(children: [
          Container(
              width: screenWidth,
              padding: EdgeInsets.only(bottom: 24, top: 8, left: 16, right: 16),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(51), // Shadow color
                  spreadRadius: 0,
                  blurRadius: 24, // Shadow blur radius
                  offset: Offset(0, -1),
                )
              ]),
              child: Container(
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    color: Theme.of(context).buttonTheme.colorScheme!.primary,
                    onPressed: handleSubmission,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Adjust the border radius
                    ),
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background),
                    ),
                  )
              )
          ),
        ]),
      ),
    );
  }
}
