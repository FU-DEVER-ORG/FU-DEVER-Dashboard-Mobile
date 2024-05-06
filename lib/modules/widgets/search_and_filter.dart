import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/filters/filter_screen.dart';

class SearchAndFilter extends StatefulWidget {
  const SearchAndFilter({super.key});

  @override
  State<SearchAndFilter> createState() => _SeachAndFilterState();
}

class _SeachAndFilterState extends State<SearchAndFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(2.0, 4.0),
                  ),
                ],
              ),
              child: SizedBox(
                height: 44,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.search_outlined),
                    ),
                    iconColor: const Color.fromARGB(255, 215, 215, 215),
                    hintText: 'Tìm thành viên',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    // Xử lý khi giá trị tìm kiếm thay đổi
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: const SizedBox(width: 8)),
          // Expanded(
            // flex: 1,
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const FilterScreen(),
                    ),
                  );
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                      offset: const Offset(2.0, 4.0),
                    ),
                  ],
                ),
                height: 44,
                width: 52,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: SvgPicture.asset(
                    'assets/images/filter.svg',
                    fit: BoxFit.cover,
                  ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
