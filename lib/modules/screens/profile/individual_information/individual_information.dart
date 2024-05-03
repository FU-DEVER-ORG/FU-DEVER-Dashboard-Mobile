import 'package:flutter/material.dart';

class IndividualInformationScreen extends StatefulWidget {
  const IndividualInformationScreen({
    super.key,
    required this.title,
  });

  final String title;
  @override
  State<IndividualInformationScreen> createState() =>
      _IndividualInformationScreenState();
}

class _IndividualInformationScreenState
    extends State<IndividualInformationScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> clubPositionList = [
      'Trưởng ban',
      'Phó ban',
      'Thành viên',
    ];
    List<String> boardList = [
      'Học thuật',
      'Truyền thông',
      'Sự kiện',
    ];
    String dropdownValue = '';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('Họ'),
              subtitle: TextField(
                decoration: InputDecoration(
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
                  labelText: 'Nhập họ',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
            ListTile(
              title: Text('Tên'),
              subtitle: TextField(
                decoration: InputDecoration(
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
                  labelText: 'Nhập tên của bạn',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
            ListTile(
              title: Text('Ngày sinh'),
              subtitle: TextField(
                decoration: InputDecoration(
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
                  labelText: 'Chọn ngày sinh',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 215, 215, 215),
                  ),
                  suffixIcon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Color.fromARGB(255, 215, 215, 215),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Nơi ở'),
              subtitle: TextField(
                decoration: InputDecoration(
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
                  labelText: 'Nơi ở hiện tại',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
            ListTile(
              title: Text('Chức vụ CLB'),
              subtitle: DropdownMenu<String>(
                width: MediaQuery.of(context).size.width - 40,
                initialSelection: dropdownValue,
                onSelected: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries: clubPositionList
                    .map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
            ListTile(
              title: Text('Ban hoạt động'),
              subtitle: DropdownMenu<String>(
                width: MediaQuery.of(context).size.width - 40,
                initialSelection: dropdownValue,
                onSelected: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    boardList.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
            ListTile(
              title: Text('Nghề nghiệp'),
              subtitle: TextField(
                decoration: InputDecoration(
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
                  labelText: 'Công việc hiện tại',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
            ListTile(
              title: Text('Nơi làm việc'),
              subtitle: TextField(
                decoration: InputDecoration(
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
                  labelText: 'Nơi làm việc hiện tại',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
            ListTile(
              title: Text('Trường học'),
              subtitle: TextField(
                decoration: InputDecoration(
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
                  labelText: 'Trường học gần nhất đang/đã từng học',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
            ListTile(
              title: Text('Chuyên ngành'),
              subtitle: TextField(
                decoration: InputDecoration(
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
                  labelText: 'Chuyên ngành của bạn',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
            ListTile(
              title: Text('Ngày tham gia CLB'),
              subtitle: TextField(
                decoration: InputDecoration(
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
                  labelText: 'Ngày tham gia (Gen)',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 89,
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
          padding: EdgeInsets.fromLTRB(16, 8, 16, 30),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              fixedSize: const Size(160, 20),
            ),
            child: const Text('Xác nhận'),
          ),
        ),
      ),
    );
  }
}
