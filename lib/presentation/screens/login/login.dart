import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/screens/home/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
            screenWidth / 10,
            screenHeight / 8, // Adjusted padding from top to center the logo
            screenWidth / 10,
            0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/fu-dever-logo.png",
                  width: screenHeight / 5,
                ),
              ),
              const SizedBox(
                  height: 20), // Increased space between logo and text
              const Text("Sign in",
                  style: TextStyle(fontSize: 20)), // Increased font size
              const SizedBox(height: 30),
              const LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  void _tapLogion() {
    setState(() {
      Navigator.of(context).pushNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Your email"),
          const SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  // borderSide: BorderSide(
                  //     color: Theme.of(context).colorScheme.onPrimary),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              hintText: "name@gmail.com",
              // hintStyle:
              //     TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
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
          const SizedBox(
              height: 20), // Increased space between email and password fields
          const Text("Your password"),
          const SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  // borderSide: BorderSide(
                  //     color: Theme.of(context).colorScheme.dar),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              hintText: "Enter your password",
              // hintStyle:
              //     TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (isChecked) {},
                  ),
                  const Text("Remember me"),
                ],
              ),
              const Text("Forget Password")
            ],
          ),
          const SizedBox(
              height:
                  20), // Increased space between remember me and login button
          ElevatedButton(
            onPressed: _tapLogion,
            child: const Text("Login to your account"),
          ),
        ],
      ),
    );
  }
}
