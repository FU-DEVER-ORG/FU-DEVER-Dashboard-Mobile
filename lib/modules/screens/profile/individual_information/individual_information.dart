import 'package:flutter/material.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/modules/screens/profile/profile_screen.dart';
import 'package:fudever_dashboard/modules/widgets/custom_text_fields.dart';

class IndividualInformationScreen extends StatefulWidget {
  const IndividualInformationScreen({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;
  final String title;

  @override
  State<IndividualInformationScreen> createState() =>
      _IndividualInformationScreenState();
}

class _IndividualInformationScreenState
    extends State<IndividualInformationScreen> {
  RegExp regExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  String dropdownValue = '';
  final List<String> clubPositionList = [
    'Trưởng ban',
    'Phó ban',
    'Thành viên',
  ];
  final List<String> boardList = [
    'Học thuật',
    'Truyền thông',
    'Sự kiện',
  ];
  final Map<String, dynamic> boardConstants = {
    'Học thuật':"ACADEMIC",
    'Truyền thông':"MEDIA",
    'Sự kiện':"EVENT"
  };
  final List<String> majorList = [
    'Kĩ thuật phần mềm',
    'An toàn thông tin',
    'Trí tuệ nhân tạo',
    'Thiết kế mỹ thuật số'
  ];
  final Map<String, dynamic> majorConstants = {
    'Kĩ thuật phần mềm':"SOFTWARE",
    'An toàn thông tin':"SECURITY",
    'Trí tuệ nhân tạo':"AI",
    'Thiết kế mỹ thuật số': "DIGITAL"
  };

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

  void handleSubmit() async {
    if (firstnameController.text.isNotEmpty &&
        lastnameController.text.isNotEmpty &&
        hometownController.text.isNotEmpty &&
        schoolController.text.isNotEmpty) {
      if (!regExp.hasMatch(dobController.text)) {
        return;
      }
      DateTime dateTime = DateTime.parse(dobController.text);
      dateTime = dateTime.add(const Duration(days: 1));
      print({
        ...widget.data['majorId'],
        "name" : majorController.text,
        "constant": majorConstants[majorController.text],
      });
      Map<String, dynamic> updated = {
        "firstname": firstnameController.text,
        "lastname": lastnameController.text,
        "dob": dateTime.toUtc().toIso8601String(),
        "majorId": {
          ...widget.data['majorId'],
          "name" : majorController.text,
          "constant": majorConstants[majorController.text],
        },
        "hometown": hometownController.text,
        "job": jobController.text,
        "workplace": workplaceController.text,
        "school": schoolController.text,
      };
      dynamic response = await UserController.editUsers(options: updated);
      if (response['status'] == 'success') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(
                data: response['data'], token: response['data']['token']),
          ),
        );
      }else{
        print(response);
      }
    }
  }

  @override
  void initState() {
    firstnameController.text = widget.data['firstname'];
    lastnameController.text = widget.data['lastname'];
    DateTime dob = DateTime.parse(widget.data['dob']);
    dobController.text = '${dob.year}-${dob.month}-${dob.day}';
    hometownController.text = widget.data['hometown'];
    positionController.text = widget.data['positionId']['name'];
    boardController.text = widget.data['departments'][0]['name'];
    jobController.text = widget.data['job'];
    workplaceController.text = widget.data['workplace'];
    schoolController.text = widget.data['school'];
    majorController.text = widget.data['majorId']['name'];
    print({
      ...widget.data['majorId'],
      "name" : majorController.text,
      "constant": majorConstants[majorController.text],
    });
    super.initState();
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
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Column(
              children: [
                CustomField(
                  title: 'Họ',
                  hintText: 'Nhập họ',
                  controller: firstnameController,
                  isCompulsory: true,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomField(
                  title: 'Tên',
                  hintText: 'Nhập tên của bạn',
                  controller: lastnameController,
                  isCompulsory: true,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDateField(
                  title: 'Ngày sinh',
                  hintText: 'Chọn ngày sinh',
                  controller: dobController,
                  isCompulsory: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomField(
                  title: 'Nơi ở',
                  hintText: 'Nơi ở hiện tại',
                  controller: hometownController,
                  isCompulsory: true,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomReadOnlyDropdown(
                    title: 'Chức vụ CLB',
                    dropdownValue: "Chọn chức vụ",
                    // context: context,
                    controller: positionController,
                    filterList: clubPositionList),
                SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                    title: 'Ban hoạt động',
                    dropdownValue: "Chọn ban của bạn",
                    // context: context,
                    controller: boardController,
                    filterList: boardList),
                SizedBox(
                  height: 10,
                ),
                CustomField(
                    title: 'Nghề nghiệp',
                    hintText: 'Công việc hiện tại',
                    controller: jobController,
                    isCompulsory: false),
                SizedBox(
                  height: 10,
                ),
                CustomField(
                    title: 'Nơi làm việc',
                    hintText: 'Nơi làm việc hiện tại',
                    controller: workplaceController,
                    isCompulsory: false),
                SizedBox(
                  height: 10,
                ),
                CustomField(
                  title: 'Trường học',
                  hintText: 'Trường học gần nhất đang/đã từng học',
                  controller: schoolController,
                  isCompulsory: true,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                  title: 'Chuyên ngành',
                  dropdownValue: "Chuyên ngành của bạn",
                  // context: context,
                  controller: majorController,
                  filterList: majorList),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Wrap(children: [
          Container(
              width: screenWidth,
              padding: const EdgeInsets.only(
                  bottom: 24, top: 8, left: 16, right: 16),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(51), // Shadow color
                  spreadRadius: 0,
                  blurRadius: 24, // Shadow blur radius
                  offset: const Offset(0, -1),
                )
              ]),
              child: Container(
                  child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  onPressed: handleSubmit,
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
        ]),
      ),
    );
  }
}
