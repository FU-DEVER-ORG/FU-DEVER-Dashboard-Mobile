import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomField extends StatefulWidget {
  const CustomField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.isCompulsory,
    this.validation = _defaultValidation,
    this.readOnly = false,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isCompulsory;
  final String? Function(String?) validation;
  final bool readOnly;

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
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Text(widget.title),
              (widget.isCompulsory)
                  ? const Text(
                      " *",
                      style: TextStyle(color: Colors.red),
                    )
                  : Container(),
            ],
          ),
        ),
        TextFormField(
          readOnly: widget.readOnly,
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 215, 215, 215)),
          ),
          validator: widget.validation
        ),
      ],
    );
  }
}

class CustomDateField extends StatefulWidget {
  CustomDateField(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.isCompulsory,
      this.validation = _defaultValidation});

  late String title;
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
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Text(widget.title),
              (widget.isCompulsory)
                  ? const Text(
                      " *",
                      style: TextStyle(color: Colors.red),
                    )
                  : Container(),
            ],
          ),
        ),
        TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.date_range,
                  color: Color.fromARGB(255, 215, 215, 215),
                  size: 25,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 215, 215, 215)),
            ),
            validator: widget.validation),
      ],
    );
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    required this.title,
    required this.controller,
    required this.dropdownValue,
    required this.filterList,
    super.key,
  });

  final String title;
  final TextEditingController controller;
  final String dropdownValue;
  final List<String> filterList;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.title),
                  ],
                ),
              ),
            ),
            DropdownMenu<String>(

              controller: widget.controller,
              trailingIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.grey,
              ),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 215, 215, 215),),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 215, 215, 215),),
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
              dropdownMenuEntries: widget.filterList
                  .map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomReadOnlyDropdown extends StatefulWidget {
  const CustomReadOnlyDropdown({
    required this.title,
    required this.controller,
    required this.dropdownValue,
    required this.filterList,
    super.key,
  });

  final String title;
  final TextEditingController controller;
  final String dropdownValue;
  final List<String> filterList;

  @override
  State<CustomReadOnlyDropdown> createState() => _CustomReadOnlyDropdownState();
}

class _CustomReadOnlyDropdownState extends State<CustomReadOnlyDropdown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.title),
                  ],
                ),
              ),
            ),
            IgnorePointer(
              child: DropdownMenu<String>(
                controller: widget.controller,
                trailingIcon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey,
                ),
                inputDecorationTheme: const InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215),),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 215, 215, 215),),
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
                dropdownMenuEntries: widget.filterList
                    .map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
