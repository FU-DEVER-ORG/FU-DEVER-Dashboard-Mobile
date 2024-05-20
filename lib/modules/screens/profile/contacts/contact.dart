import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/modules/screens/profile/profile_screen.dart';
import 'package:fudever_dashboard/modules/widgets/custom_text_fields.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key,required this.data, required this.title});

  final String title;
  final Map<String, String> data;

  @override
  State<ContactsScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<ContactsScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey =GlobalKey<FormState>();
  late String email = "";
  late String phone = "";
  void handleSubmit()async{
    if(phoneController.text.isNotEmpty){
      Map<String, dynamic> updatedContacts = {
        "phone" : phoneController.text,
      };
      dynamic response = await UserController.editUsers(options: updatedContacts);
      if(response['status'] == 'success'){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(data: response['data'],),
          ),
        );
      }
    }
  }
  @override
  void initState() {
    emailController.text = widget.data['email']??"";
    phoneController.text = widget.data['phone']??"";
    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });
    phoneController.addListener(() {
      setState(() {
        phone = phoneController.text;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:20, horizontal: 20.0),
            child: Column(
              children: [
                CustomField(title: "Email",hintText: "Email của bạn",controller: emailController,isCompulsory: true,readOnly: true,),
                SizedBox(height: 10,),
                CustomField(title: "Số điện thoại",hintText: "Số điện thoại của bạn",controller: phoneController,isCompulsory: true,),
              ]
            ),
          ),
        ),
        bottomSheet: Wrap(
          children: [
          Container(
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(20, 8,20,24),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(51), // Shadow color
                spreadRadius: 0,
                blurRadius: 24, // Shadow blur radius
                offset: Offset(0, -1),
              )
            ]),
            child: Container(
              width: screenWidth,
              child: MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 16),
                color: Theme.of(context).buttonTheme.colorScheme!.primary,
                onPressed: handleSubmit,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Xác nhận",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
