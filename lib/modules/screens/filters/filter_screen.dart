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
  String dropdownValueGen = 'Gen 5';
  String dropdownValuePosition = 'Chủ nhiệm';
  String dropdownValueDeparment = 'Ban học thuật';
  String dropdownValueMajor = 'Kĩ thuật phần mềm';

  TextEditingController controllerGen = TextEditingController();
  TextEditingController controllerPosition = TextEditingController();
  TextEditingController controllerDepartment = TextEditingController();
  TextEditingController controllerMajor = TextEditingController();


  Widget buildDropdown(
      {required String title,
      required TextEditingController controller,
      required String dropdownValue,
      required List<String> filterList}) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(title),
      ),
      subtitle: DropdownMenu<String>(
        controller: controller,
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
        textStyle: Theme.of(context).textTheme.bodySmall,
        selectedTrailingIcon: Icon(
          Icons.expand_less,
          color: Theme.of(context).iconTheme.color,
        ),
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
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      bottomNavigationBar: Container(
        height: screenHeight / 10,
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
                onPressed: () {
                  controllerMajor.text= dropdownValueMajor;
                  controllerGen.text = dropdownValueGen;
                  controllerPosition.text = dropdownValuePosition;
                  controllerDepartment.text = dropdownValueDeparment;
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                  fixedSize: Size(screenWidth / 2.3, screenHeight),
                ),
                child: const Text('Xóa bộ lọc'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/",arguments: {
                    "major":controllerMajor.text,
                    "gen":controllerGen.text,
                    "position":controllerPosition.text,
                    "department":controllerDepartment.text,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fixedSize: Size(screenWidth / 2.3, screenHeight),
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
            buildDropdown(title: 'Khóa', dropdownValue: dropdownValueGen, filterList: studentYearList, controller: controllerGen),
            buildDropdown(title: 'Chức vụ CLB', dropdownValue:  dropdownValuePosition, filterList: clubPositionList,controller: controllerPosition),
            buildDropdown(title: 'Ban', dropdownValue:  dropdownValueDeparment, filterList: boardList, controller: controllerDepartment),
            buildDropdown(title: 'Chuyên ngành', dropdownValue:  dropdownValueMajor, filterList: majorList,controller: controllerMajor),
          ],
        ),
      ),
    );
  }
}
