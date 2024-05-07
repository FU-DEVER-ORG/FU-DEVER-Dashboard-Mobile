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
  final List<String> majorList = ['Kĩ thuật phần mềm', 'An toàn thông tin', 'Trí tuệ nhân tạo', 'Thiết kế mỹ thuật số'];

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

  Widget buildTextField(String title, String hintText, {bool isCompulsory = true}) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Text(title),
            (isCompulsory)?const Text(
              " *",
              style: TextStyle(color: Colors.red),
            ):Container(),
          ],
        ),
      ),
      subtitle: TextField(
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
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 215, 215, 215)
            ),
          ),
      ),
    );
  }
  Widget builDateField(String title, String hintText, {bool isCompulsory = true}) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Text(title),
            (isCompulsory)?const Text(
              " *",
              style: TextStyle(color: Colors.red),
            ):Container(),
          ],
        ),
      ),
      subtitle: TextField(

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
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 215, 215, 215)
            ),
          ),
      ),
    );
  }

  Widget buildDropdown(String title, String hintText, List<String> itemList) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Text(title),
            const Text(" *", style: TextStyle(color: Colors.red),)
          ],
        ),
      ),
      subtitle: DropdownMenu<String>(
        trailingIcon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Color.fromARGB(255, 215, 215, 215),
          size: 30,
        ),
        inputDecorationTheme: InputDecorationTheme(
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
          hintStyle: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 215, 215, 215)
          ),
        ),
        hintText: hintText,
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
        selectedTrailingIcon: Icon(Icons.expand_less,color: Theme.of(context).iconTheme.color,),
        dropdownMenuEntries:
        itemList.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
          child: Container(
            padding: EdgeInsets.only(bottom: 12),
            child: Column(
              children: [
                buildTextField('Họ', 'Nhập họ'),
                buildTextField('Tên', 'Nhập tên của bạn'),
                builDateField('Ngày sinh', 'Chọn ngày sinh'),
                buildTextField('Nơi ở', 'Nơi ở hiện tại'),
                buildDropdown('Chức vụ CLB', "Chọn chức vụ", clubPositionList),
                buildDropdown('Ban hoạt động', "Chọn ban của bạn", boardList),
                buildTextField('Nghề nghiệp', 'Công việc hiện tại', isCompulsory: false),
                buildTextField('Nơi làm việc', 'Nơi làm việc hiện tại', isCompulsory: false),
                buildTextField('Trường học', 'Trường học gần nhất đang/đã từng học'),
                buildDropdown('Chuyên ngành', "Chuyên ngành của bạn", majorList),
                builDateField('Ngày tham gia CLB', 'Ngày tham gia (Gen)'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Wrap(
            children: [Container(
                width: screenWidth,
                padding: EdgeInsets.only(bottom: 24, top: 8, left: 16, right: 16),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(51), // Shadow color
                    spreadRadius: 0,
                    blurRadius: 24, // Shadow blur radius
                    offset: Offset(0, -1),
                  )
                ]),
                child: Container(
                    child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 16),
                      color: Theme.of(context).buttonTheme.colorScheme!.primary,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(8.0), // Adjust the border radius
                      ),
                      child: Text(
                        "Xác nhận",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    )
                )
            ),
            ]
        ),
      ),
    );
  }
}
