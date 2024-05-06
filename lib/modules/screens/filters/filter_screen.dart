import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> studentYearList = ['Gen 5', 'Gen 6', 'Gen 7'];
  final List<String> clubPositionList = [
    'Chủ nhiệm',
    'Phó chủ nhiệm',
    'Thư ký',
    'Trưởng ban',
    'Phó ban',
    'Thành viên'
  ];
  final List<String> boardList = [
    'Ban học thuật',
    'Ban truyền thông',
    'Ban sự kiện'
  ];
  final List<String> majorList = [
    'Kĩ thuật phần mềm',
    'An toàn thông tin',
    'Trí tuệ nhân tạo',
    'Thiết kế mỹ thuật số'
  ];
  String dropdownValue1 = 'Gen 5';
  String dropdownValue2 = 'Chủ nhiệm';
  String dropdownValue3 = 'Ban học thuật';
  String dropdownValue4 = 'Kĩ thuật phần mềm';

  Widget buildDropdown(String title, String dropdownValue,
      List<String> filterList, Function(String?) onChanged) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(title),
      ),
      subtitle: DropdownMenu<String>(
        trailingIcon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Colors.grey,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color.fromARGB(255, 243, 249, 253),
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
        hintText: dropdownValue,
        width: MediaQuery.of(context).size.width - 40,
        initialSelection: dropdownValue,
        onSelected: (String? value) {
          if (value != null) {
            setState(() {
              dropdownValue = value;
            });
          }
        },
        textStyle: Theme.of(context).textTheme.bodySmall,
        // inputDecorationTheme: InputDecorationTheme(
        //   isDense: true,
        //   contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 11),
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Theme.of(context).textTheme.bodySmall!.color!),
        //     borderRadius: BorderRadius.circular(10)
        //   )
        // ),
        // trailingIcon: Icon(Icons.expand_more,color: Theme.of(context).iconTheme.color,),
        selectedTrailingIcon: Icon(Icons.expand_less,color: Theme.of(context).iconTheme.color,),
        dropdownMenuEntries:
            filterList.map<DropdownMenuEntry<String>>((String value) {
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
            buildDropdown('Khóa', dropdownValue1, studentYearList, (value) {
              setState(() {
                dropdownValue1 = value!;
              });
            }),
            buildDropdown('Chức vụ CLB', dropdownValue2, clubPositionList,
                (value) {
              setState(() {
                dropdownValue2 = value!;
              });
            }),
            buildDropdown('Ban', dropdownValue3, boardList, (value) {
              setState(() {
                dropdownValue3 = value!;
              });
            }),
            buildDropdown('Chuyên ngành', dropdownValue4, majorList, (value) {
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
