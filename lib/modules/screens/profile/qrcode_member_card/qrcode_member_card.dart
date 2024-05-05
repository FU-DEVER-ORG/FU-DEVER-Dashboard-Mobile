import 'package:flutter/material.dart';

class QrCodeMember extends StatefulWidget {
  const QrCodeMember({super.key});

  @override
  State<QrCodeMember> createState() => _QrCodeMemberState();
}

class _QrCodeMemberState extends State<QrCodeMember> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text("Có thể có",
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
