import 'package:flutter/material.dart';

class IndividualInformationScreen extends StatefulWidget {
  const IndividualInformationScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<IndividualInformationScreen> createState() =>
      _IndividualInformationScreenState();
}

class _IndividualInformationScreenState
    extends State<IndividualInformationScreen> {
  String dropdownValue = '';
  final List<String> clubPositionList = ['Trưởng ban', 'Phó ban', 'Thành viên'];
  final List<String> boardList = ['Học thuật', 'Truyền thông', 'Sự kiện'];

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
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
      labelText: labelText,
      labelStyle: const TextStyle(color: Color.fromARGB(255, 215, 215, 215)),
    );
  }

  Widget buildTextField(String title, String hintText) {
    return ListTile(
      title: Text(title),
      subtitle: TextField(
        decoration: buildInputDecoration(hintText),
      ),
    );
  }

  Widget buildDropdown(String title, List<String> itemList) {
    return ListTile(
      title: Text(title),
      subtitle: DropdownMenu<String>(
        trailingIcon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Colors.grey,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
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
          labelStyle: TextStyle(color: Color.fromARGB(255, 215, 215, 215)),
        ),
        hintText: dropdownValue,
        width: MediaQuery.of(context).size.width - 40,
        initialSelection: dropdownValue,
        onSelected: (value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries:
            itemList.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.onBackground,),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField('Họ', 'Nhập họ'),
              buildTextField('Tên', 'Nhập tên của bạn'),
              buildTextField('Ngày sinh', 'Chọn ngày sinh'),
              buildTextField('Nơi ở', 'Nơi ở hiện tại'),
              buildDropdown('Chức vụ CLB', clubPositionList),
              buildDropdown('Ban hoạt động', boardList),
              buildTextField('Nghề nghiệp', 'Công việc hiện tại'),
              buildTextField('Nơi làm việc', 'Nơi làm việc hiện tại'),
              buildTextField(
                  'Trường học', 'Trường học gần nhất đang/đã từng học'),
              buildTextField('Chuyên ngành', 'Chuyên ngành của bạn'),
              buildTextField('Ngày tham gia CLB', 'Ngày tham gia (Gen)'),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 89,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3.0,
                blurRadius: 5.0,
                offset: const Offset(2.0, 4.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(160, 20),
              ),
              child: const Text('Xác nhận'),
            ),
          ),
        ),
      ),
    );
  }
}
