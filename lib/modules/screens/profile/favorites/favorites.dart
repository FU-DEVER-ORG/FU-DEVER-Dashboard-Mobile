import 'package:flutter/material.dart';
import 'package:fudever_dashboard/modules/widgets/custom_text_fields.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    super.key,
    required this.title,
    required this.data,
  });

  final List<dynamic> data;
  final String title;

  @override
  State<FavoritesScreen> createState() => _FavouritesState();
}

class _FavouritesState extends State<FavoritesScreen> {
  List<String> favourites = [];
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    favourites = widget.data.map((e) => e.toString()).toList();
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
          leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.onBackground,),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                return Skill(skill: favourites[index]);
              }),
        ),
        bottomSheet: Wrap(
          children: [
            Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(20, 8,20,24),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(51), // Shadow color
                    spreadRadius: 0,
                    blurRadius: 24, // Shadow blur radius
                    offset: Offset(0, -1),
                  )
                ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomField(title: "Sở thích", hintText: "Nhập sở thích của bạn", controller: controller, isCompulsory: true),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenWidth,
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        color: Colors.blue,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the border radius
                        ),
                        child: Text(
                          "Thêm sở thích",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background),
                        ),
                      )),
                ],
              )),
        ]),
      ),
    );
  }
}
