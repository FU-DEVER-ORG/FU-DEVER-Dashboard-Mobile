import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrCodeMember extends StatefulWidget {
  const QrCodeMember({super.key});

  @override
  State<QrCodeMember> createState() => _QrCodeMemberState();
}

class _QrCodeMemberState extends State<QrCodeMember> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Thẻ thành viên", style: TextStyle(color: Theme.of(context).colorScheme.onBackground),),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.onBackground,),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(57, 80, 57, 60),
        child: Column(
          children: [
            Material(
              elevation: 10,
              shadowColor: Theme.of(context).shadowColor,
              child: SvgPicture.asset(
                "assets/images/QR-user.svg",
                fit: BoxFit.cover,
                width: screenWidth*0.8,),
            ),
            SizedBox(height: 12,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: SizedBox(
                      height: screenWidth/9,
                      width: screenWidth/9,
                      child: Image.asset(
                        'assets/images/demo-image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'emaiil@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
