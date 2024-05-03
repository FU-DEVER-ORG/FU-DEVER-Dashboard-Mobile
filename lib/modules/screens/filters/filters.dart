import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> list = ['Option 1', 'Option 2', 'Option 3'];
  List<String> Khoa = ['Gen 5', 'Gen 6', 'Gen 7'];

  late String dropdownValue = list[1];

  @override
  void initState() {
    super.initState();
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
        height: screenHeight/12,
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
          padding: const EdgeInsets.only(bottom: 10, top: 8),
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: const Text('Khóa'),
                ),
                subtitle: DropdownMenu<String>(
                  width: screenWidth*0.9,
                  initialSelection: dropdownValue,
                  onSelected: (String? value) {
                    if (value != null) {
                      setState(() {
                        dropdownValue = value;
                      });
                    }
                  },
                  textStyle: TextStyle(color: Colors.grey.shade400),
                  inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)
                      )
                  ),
                  trailingIcon: Icon(Icons.expand_more,color: Colors.grey.shade400,),
                  selectedTrailingIcon: Icon(Icons.expand_less,color: Colors.grey.shade400,),
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: const Text('Chức vụ CLB'),
                ),
                subtitle: DropdownMenu<String>(
                  width: screenWidth*0.9,
                  initialSelection: dropdownValue,
                  onSelected: (String? value) {
                    if (value != null) {
                      setState(() {
                        dropdownValue = value;
                      });
                    }
                  },
                  textStyle: TextStyle(color: Colors.grey.shade400),
                  inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)
                      )
                  ),
                  trailingIcon: Icon(Icons.expand_more,color: Colors.grey.shade400,),
                  selectedTrailingIcon: Icon(Icons.expand_less,color: Colors.grey.shade400,),
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: const Text('Ban'),
                ),
                subtitle: DropdownMenu<String>(
                  width: screenWidth*0.9,
                  initialSelection: dropdownValue,
                  onSelected: (String? value) {
                    if (value != null) {
                      setState(() {
                        dropdownValue = value;
                      });
                    }
                  },
                  textStyle: TextStyle(color: Colors.grey.shade400),
                  inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)
                      )
                  ),
                  trailingIcon: Icon(Icons.expand_more,color: Colors.grey.shade400,),
                  selectedTrailingIcon: Icon(Icons.expand_less,color: Colors.grey.shade400,),
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: const Text('Chuyên ngành'),
                ),
                subtitle: DropdownMenu<String>(
                  width: screenWidth*0.9,
                  initialSelection: dropdownValue,
                  onSelected: (String? value) {
                    if (value != null) {
                      setState(() {
                        dropdownValue = value;
                      });
                    }
                  },
                  textStyle: TextStyle(color: Colors.grey.shade400),
                  inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)
                    )
                  ),
                  trailingIcon: Icon(Icons.expand_more,color: Colors.grey.shade400,),
                  selectedTrailingIcon: Icon(Icons.expand_less,color: Colors.grey.shade400,),
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
