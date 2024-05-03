import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> list = ['Option 1', 'Option 2', 'Option 3'];
  String dropdownValue1 = 'Option 1';
  String dropdownValue2 = 'Option 1';
  String dropdownValue3 = 'Option 1';
  String dropdownValue4 = 'Option 1';

  Widget buildDropdown(
      String title, String dropdownValue, Function(String?) onChanged) {
    return ListTile(
      title: Text(title),
      subtitle: DropdownMenu<String>(
        width: MediaQuery.of(context).size.width - 40,
        initialSelection: dropdownValue,
        onSelected: onChanged,
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Bộ lọc"),
      ),
      bottomNavigationBar: Container(
        height: 89,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 3.0,
              blurRadius: 5.0,
              offset: const Offset(2.0, 4.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fixedSize: const Size(160, 51),
                ),
                child: const Text('Xóa bộ lọc'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fixedSize: const Size(160, 51),
                ),
                child: const Text('Xác nhận'),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildDropdown('Khóa', dropdownValue1, (value) {
              setState(() {
                dropdownValue1 = value!;
              });
            }),
            buildDropdown('Chức vụ CLB', dropdownValue2, (value) {
              setState(() {
                dropdownValue2 = value!;
              });
            }),
            buildDropdown('Ban', dropdownValue3, (value) {
              setState(() {
                dropdownValue3 = value!;
              });
            }),
            buildDropdown('Chuyên ngành', dropdownValue4, (value) {
              setState(() {
                dropdownValue4 = value!;
              });
            }),
          ],
        ),
      ),
    );
  }
}
