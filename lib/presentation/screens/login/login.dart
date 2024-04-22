import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(screenWidth/10, screenWidth/10, screenWidth/5, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/images/fu-dever-logo.png",width: screenHeight/5,)),
            Text("Sign in"),
            SizedBox(height: 30),
            LoginForm()
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your email"),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2),
                    borderRadius: BorderRadius.circular(15)
                ),
                hintText: "name@company.com",
                hintStyle: TextStyle(color: Colors.black38)
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid email';
              } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value))
                return 'Enter a valid email';
              else
                return null;
            },
          ),
          SizedBox(height: 30),
          Text("Your password"),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2),
                    borderRadius: BorderRadius.circular(15)
                ),
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.black38)
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid email';
              } else if (!RegExp(r'^[\w]+$').hasMatch(value))
                return 'Enter a valid email';
              else
                return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (isChecked){},
                  ),
                  Text("Remember me"),
                ],
              ),
              Text("Forget Password")
            ],
          ),
          MaterialButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            color: Color(0xFF0065A9),
            child: Text("Login to your account"),
          ),
        ],
      ),
    );
  }
}

