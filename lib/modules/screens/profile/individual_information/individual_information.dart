import 'package:flutter/material.dart';
import 'package:fudever_dashboard/modules/widgets/custom_text_fields.dart';

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

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController hometownController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController boardController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController workplaceController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final TextEditingController dateJoinController = TextEditingController();
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
                CustomField(title: 'Họ',hintText: 'Nhập họ', controller: firstnameController, isCompulsory: true,),
                CustomField(title: 'Tên',hintText:  'Nhập tên của bạn', controller: lastnameController, isCompulsory: true,),
                CustomDateField(title: 'Ngày sinh',hintText:  'Chọn ngày sinh', controller: dobController, isCompulsory: false,),
                CustomField(title: 'Nơi ở',hintText:  'Nơi ở hiện tại', controller: hometownController, isCompulsory: true,),
                CustomDropdown(title: 'Chức vụ CLB',dropdownValue:  "Chọn chức vụ", context: context, controller: positionController, filterList: clubPositionList),
                CustomDropdown(title: 'Ban hoạt động',dropdownValue:  "Chọn ban của bạn", context: context, controller: boardController, filterList: boardList),
                CustomField(title: 'Nghề nghiệp',hintText:  'Công việc hiện tại',controller: jobController, isCompulsory: false),
                CustomField(title: 'Nơi làm việc',hintText:  'Nơi làm việc hiện tại',controller: workplaceController, isCompulsory: false),
                CustomField(title: 'Trường học',hintText:  'Trường học gần nhất đang/đã từng học', controller: schoolController, isCompulsory: true,),
                CustomDropdown(title: 'Chuyên ngành',dropdownValue:  "Chuyên ngành của bạn", context: context, controller: majorController, filterList: majorList),
                CustomDateField(title: 'Ngày tham gia CLB',hintText:  'Ngày tham gia (Gen)', controller: dateJoinController, isCompulsory: false,),
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
