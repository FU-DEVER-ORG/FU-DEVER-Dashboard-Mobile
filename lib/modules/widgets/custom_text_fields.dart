import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CompulsoryTextField extends StatefulWidget {
  const CompulsoryTextField({super.key});

  @override
  State<CompulsoryTextField> createState() => _CompulsoryTextFieldState();
}

class _CompulsoryTextFieldState extends State<CompulsoryTextField> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text('Số điện thoại'),
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
      subtitle: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 215, 215, 215), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 215, 215, 215), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Số điện thoại của bạn',
          labelStyle: const TextStyle(
              color: Color.fromARGB(255, 215, 215, 215)),
        ),
      ),
    );
  }
}
