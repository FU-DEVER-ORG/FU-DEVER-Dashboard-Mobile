import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Sign in"),
          SizedBox(height: 30),
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
          ),
          Row(
            children: [
              Checkbox(
                  value: false,
                  onChanged: (isChecked){},
                  semanticLabel: "Remember me",
              ),
              Text("Forget Password")

            ],
          ),
          MaterialButton(
            onPressed: (){},
            color: Color(0xFF0065A9),
            child: Text("Login to your account"),
          )

        ],
      ),
    );
  }
}
