import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fudever_dashboard/api/department_api.dart';
import 'package:fudever_dashboard/api/major_api.dart';
import 'package:fudever_dashboard/api/position_api.dart';
import 'package:fudever_dashboard/controller/filter_controller.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final FilterService _storageService = FilterService();

  final List<String> genList = [
    'Gen 2',
    'Gen 3',
    'Gen 4',
    'Gen 5',
    'Gen 6',
    'Gen 7',
    'Any'
  ];
  final List<String> kList = ['K15', 'K16', 'K17', 'K18', 'K19', 'Any'];

  List<String> clubPositionList = ['Any'];
  List<String> boardList = ['Any'];
  List<String> majorList = ['Any'];

  late dynamic positionsRes = null;
  late dynamic majorsRes = null;
  late dynamic departmentsRes = null;

  String dropdownValueGen = 'Any';
  String dropdownValueK = 'Any';
  String dropdownValuePosition = 'Any';
  String dropdownValueDepartment = 'Any';
  String dropdownValueMajor = 'Any';

  TextEditingController controllerGen = TextEditingController();
  TextEditingController controllerK = TextEditingController();
  TextEditingController controllerPosition = TextEditingController();
  TextEditingController controllerDepartment = TextEditingController();
  TextEditingController controllerMajor = TextEditingController();

  late Future<void> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = getData();
    loadFilterValues();
  }

  Future<void> getData() async {
    try {
      positionsRes = await PositionController.getPositions();
      majorsRes = await MajorController.getMajors();
      departmentsRes = await DepartmentController.getDepartments();

      setState(() {
        clubPositionList = (positionsRes['data'] as List)
            .map((item) => item['name'].toString())
            .toList();
        majorList = (majorsRes['data'] as List)
            .map((item) => item['name'].toString())
            .toList();
        boardList = (departmentsRes['data'] as List)
            .map((item) => item['name'].toString())
            .toList();
        // Adding 'Any' option at the end
        clubPositionList.add('Any');
        majorList.add('Any');
        boardList.add('Any');
      });
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  Future<void> loadFilterValues() async {
    dropdownValueGen = await _storageService.read('gen') ?? 'Any';
    dropdownValueK = await _storageService.read('k') ?? 'Any';
    dropdownValuePosition = await _storageService.read('position') ?? 'Any';
    dropdownValueDepartment = await _storageService.read('department') ?? 'Any';
    dropdownValueMajor = await _storageService.read('major') ?? 'Any';

    controllerGen.text = dropdownValueGen;
    controllerK.text = dropdownValueK;
    controllerPosition.text = dropdownValuePosition;
    controllerDepartment.text = dropdownValueDepartment;
    controllerMajor.text = dropdownValueMajor;
  }

  Future<void> saveFilterValues() async {
    await _storageService.write('gen', dropdownValueGen);
    await _storageService.write('k', dropdownValueK);
    await _storageService.write('position', dropdownValuePosition);
    await _storageService.write('department', dropdownValueDepartment);
    await _storageService.write('major', dropdownValueMajor);
  }

  void handleFilter() async {
    await saveFilterValues();

    Map<String, dynamic> filter = {};

    if (controllerMajor.text.isNotEmpty && controllerMajor.text != 'Any') {
      var majorOption = (majorsRes['data'] as List).firstWhere((major) {
        return controllerMajor.text == major['name'];
      });
      filter['majorId'] = majorOption["_id"];
    }

    if (controllerPosition.text.isNotEmpty && controllerPosition.text != 'Any') {
      var positionOption = (positionsRes['data'] as List).firstWhere((position) {
        return controllerPosition.text == position['name'];
      });
      filter['positionId'] = positionOption["_id"];
    }

    if (controllerDepartment.text.isNotEmpty && controllerDepartment.text != 'Any') {
      var departmentOption = (departmentsRes['data'] as List).firstWhere((department) {
        return controllerDepartment.text == department['name'];
      });
      filter['departments'] = departmentOption["_id"];
    }

    if (controllerGen.text.isNotEmpty && controllerGen.text != 'Any') {
      filter['gen'] = controllerGen.text.substring(4);
    }

    if (controllerK.text.isNotEmpty && controllerK.text != 'Any') {
      filter['kGeneration'] = controllerK.text.substring(1);
    }
    // Pass the filter object to the next screen
    Navigator.of(context).pushNamed("/", arguments: filter);
  }

  Widget buildDropdown({
    required String title,
    required TextEditingController controller,
    required String dropdownValue,
    required List<String> filterList,
  }) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(title),
      ),
      subtitle: DropdownButtonFormField<String>(
        value: dropdownValue,
        icon: Icon(Icons.keyboard_arrow_down, color: Color.fromARGB(255, 215, 215, 215),),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 243, 249, 253),
          isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          enabledBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: Color.fromARGB(255, 215, 215, 215), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
            BorderSide(color: Color.fromARGB(255, 215, 215, 215), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        items: filterList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            controller.text = newValue!;
            if (title == 'Gen') dropdownValueGen = newValue;
            if (title == 'Chức vụ CLB') dropdownValuePosition = newValue;
            if (title == 'Ban') dropdownValueDepartment = newValue;
            if (title == 'Chuyên ngành') dropdownValueMajor = newValue;
            if (title == 'Khóa') dropdownValueK = newValue;
          });
        },
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
          padding: const EdgeInsets.only(bottom: 24, top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    dropdownValueGen = 'Any';
                    dropdownValueK = 'Any';
                    dropdownValuePosition = 'Any';
                    dropdownValueDepartment = 'Any';
                    dropdownValueMajor = 'Any';

                    controllerGen.text = 'Any';
                    controllerK.text = 'Any';
                    controllerPosition.text = 'Any';
                    controllerDepartment.text = 'Any';
                    controllerMajor.text = 'Any';
                  });
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
              ElevatedButton(
                onPressed: handleFilter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fixedSize: Size(screenWidth / 2.3, screenHeight),
                ),
                child: const Text('Xác nhận'),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<void>(
        future: dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred'));
          } else {
            return ListView(
              children: [
                buildDropdown(
                  title: 'Gen',
                  controller: controllerGen,
                  dropdownValue: dropdownValueGen,
                  filterList: genList,
                ),
                buildDropdown(
                  title: 'Khóa',
                  controller: controllerK,
                  dropdownValue: dropdownValueK,
                  filterList: kList,
                ),
                buildDropdown(
                  title: 'Chức vụ CLB',
                  controller: controllerPosition,
                  dropdownValue: dropdownValuePosition,
                  filterList: clubPositionList,
                ),
                buildDropdown(
                  title: 'Ban',
                  controller: controllerDepartment,
                  dropdownValue: dropdownValueDepartment,
                  filterList: boardList,
                ),
                buildDropdown(
                  title: 'Chuyên ngành',
                  controller: controllerMajor,
                  dropdownValue: dropdownValueMajor,
                  filterList: majorList,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
