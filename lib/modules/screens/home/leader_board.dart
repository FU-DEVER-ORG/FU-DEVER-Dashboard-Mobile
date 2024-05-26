import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fudever_dashboard/modules/widgets/custom_text_fields.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final leetcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leetcode",
          style: TextStyle(color: Theme
              .of(context)
              .colorScheme
              .onBackground),
        ),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(false);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Theme
                .of(context)
                .colorScheme
                .onBackground,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              showModalBottomSheet(context: context, builder: (builder){
                return Wrap(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      child: Column(
                        children: [
                          CustomField(title: "Leetcode username", hintText: "Nhập username leetcode của bạn", controller: leetcodeController, isCompulsory: true),
                          const SizedBox(height: 10),
                          Container(
                            width: screenWidth,
                            child: MaterialButton(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              color: Theme.of(context).buttonTheme.colorScheme!.primary,
                              onPressed: (){},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                "Xác nhận",
                                style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .background,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                );
              });
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
              size: 28,
            ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: screenWidth,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopLeaders(),
                TopLeaders(isCenter: false,),
                TopLeaders()
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top:Radius.circular(30)),
                color: const Color.fromARGB(255, 243, 249, 253),
              ),
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 24),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      tileColor: Colors.transparent,
                      leading: SizedBox(
                        width: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text((index>5)?'${index+4}':' ${index+4}'),
                            SizedBox(width: 10,),
                            CircleAvatar(
                              radius: 19,
                              child: Image.asset("assets/images/Avatar.png"),
                            )
                          ],
                        ),
                      ),
                      title: Text("Marsha Fisher"),
                      trailing: Text("40 pts"),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
