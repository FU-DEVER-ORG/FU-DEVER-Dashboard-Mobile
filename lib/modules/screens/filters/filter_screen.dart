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
      String title, String dropdownValue, double width, Function(String?) onChanged) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(title),
      ),
      subtitle: DropdownMenu<String>(
        width: width*0.9,
        initialSelection: dropdownValue,
        onSelected: (String? value) {
          if (value != null) {
            setState(() {
              dropdownValue = value;
            });
          }
        },
        textStyle: Theme.of(context).textTheme.bodySmall,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 11),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).textTheme.bodySmall!.color!),
            borderRadius: BorderRadius.circular(10)
          )
        ),
        trailingIcon: Icon(Icons.expand_more,color: Theme.of(context).iconTheme.color,),
        selectedTrailingIcon: Icon(Icons.expand_less,color: Theme.of(context).iconTheme.color,),
        dropdownMenuEntries:
        list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 249, 253),
      appBar: AppBar(
        title: const Text("Bộ lọc"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      bottomNavigationBar: Container(
        height: screenHeight/10,
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
          padding: const EdgeInsets.only(bottom: 24, top: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  fixedSize: Size(screenWidth/2.3, screenHeight),
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
                  fixedSize: Size(screenWidth/2.3, screenHeight),
                ),
                child: const Text(
                  'Xác nhận',
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildDropdown('Khóa', dropdownValue1, screenWidth, (value) {
              setState(() {
                dropdownValue1 = value!;
              });
            }),
            buildDropdown('Chức vụ CLB', dropdownValue2, screenWidth,(value) {
              setState(() {
                dropdownValue2 = value!;
              });
            }),
            buildDropdown('Ban', dropdownValue3, screenWidth,(value) {
              setState(() {
                dropdownValue3 = value!;
              });
            }),
            buildDropdown('Chuyên ngành', dropdownValue4, screenWidth,(value) {
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
