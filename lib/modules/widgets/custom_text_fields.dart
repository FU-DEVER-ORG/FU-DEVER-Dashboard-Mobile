import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatefulWidget {
  const CustomField({super.key, required this.title, required this.hintText, required this.controller, required this.isCompulsory, this.validation = _defaultValidation});

  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isCompulsory;
  final String? Function(String?) validation;


  static String? _defaultValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field is empty';
    } else {
      return null;
    }
  }
  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Text(widget.title),
                (widget.isCompulsory)?const Text(
                  " *",
                  style: TextStyle(color: Colors.red),
                ):Container(),
              ],
            ),
          ),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 215, 215, 215), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 215, 215, 215), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 215, 215, 215)
              ),
            ),
            validator: widget.validation
          ),
        ],
      ),
    );
  }
}
