import 'package:flutter/material.dart';
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
  final List<String> majorList = [
    'Kĩ thuật phần mềm',
    'An toàn thông tin',
    'Trí tuệ nhân tạo',
    'Thiết kế mỹ thuật số'
  ];

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

  @override
  void initState() {
    print(widget.data);
    firstnameController.text=widget.data['firstname'];
    lastnameController.text=widget.data['lastname'];
    DateTime dob = DateTime.parse(widget.data['dob']);
    dobController.text='${dob.year}/${dob.month}/${dob.day}';
    hometownController.text=widget.data['hometown'];
    positionController.text=widget.data['positionId']['name'];
    boardController.text=widget.data['departments'][0]['name'];
    jobController.text=widget.data['job'];
    workplaceController.text=widget.data['workplace'];
    schoolController.text=widget.data['school'];
    majorController.text=widget.data['majorId']['name'];
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
                CustomField(
                  title: 'Tên',
                  hintText: 'Nhập tên của bạn',
                  controller: lastnameController,
                  isCompulsory: true,
                ),
                CustomDateField(
                  title: 'Ngày sinh',
                  hintText: 'Chọn ngày sinh',
                  controller: dobController,
                  isCompulsory: false,
                ),
                CustomField(
                  title: 'Nơi ở',
                  hintText: 'Nơi ở hiện tại',
                  controller: hometownController,
                  isCompulsory: true,
                ),
                CustomReadOnlyDropdown(
                    title: 'Chức vụ CLB',
                    dropdownValue: "Chọn chức vụ",
                    // context: context,
                    controller: positionController,
                    filterList: clubPositionList),
                CustomDropdown(
                    title: 'Ban hoạt động',
                    dropdownValue: "Chọn ban của bạn",
                    // context: context,
                    controller: boardController,
                    filterList: boardList),
                CustomField(
                    title: 'Nghề nghiệp',
                    hintText: 'Công việc hiện tại',
                    controller: jobController,
                    isCompulsory: false),
                CustomField(
                    title: 'Nơi làm việc',
                    hintText: 'Nơi làm việc hiện tại',
                    controller: workplaceController,
                    isCompulsory: false),
                CustomField(
                  title: 'Trường học',
                  hintText: 'Trường học gần nhất đang/đã từng học',
                  controller: schoolController,
                  isCompulsory: true,
                ),
                CustomDropdown(
                    title: 'Chuyên ngành',
                    dropdownValue: "Chuyên ngành của bạn",
                    // context: context,
                    controller: majorController,
                    filterList: majorList
                ),
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
              ))),
        ]),
      ),
    );
  }
}
