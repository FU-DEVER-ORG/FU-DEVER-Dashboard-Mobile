import 'package:flutter/cupertino.dart';
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
    return Column(
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
    );
  }
}
class CustomDateField extends StatefulWidget {
  const CustomDateField({super.key, required this.title, required this.hintText, required this.controller, required this.isCompulsory, this.validation = _defaultValidation});

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
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.date_range,
                color: Color.fromARGB(255, 215, 215, 215),
                size: 25,
              ),
            ),
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
    );
  }
}


class CustomDropdown extends StatefulWidget {
  CustomDropdown({required String title,
  required TextEditingController controller,
  required String dropdownValue,
  required List<String> filterList,
  required BuildContext context,
super.key});
  late String title;
  late TextEditingController controller;
  late String dropdownValue;
  late List<String> filterList;
  late BuildContext context;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(widget.title),
      ),
      subtitle: DropdownMenu<String>(
        controller: widget.controller,
        trailingIcon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Colors.grey,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color.fromARGB(255, 215, 215, 215), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color.fromARGB(255, 215, 215, 215), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 215, 215, 215),
          ),
        ),
        hintText: widget.dropdownValue,
        width: MediaQuery.of(context).size.width - 40,
        initialSelection: widget.dropdownValue,
        textStyle: Theme.of(context).textTheme.bodySmall,
        selectedTrailingIcon: Icon(
          Icons.expand_less,
          color: Theme.of(context).iconTheme.color,
        ),
        dropdownMenuEntries:
        widget.filterList.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}

