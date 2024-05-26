import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fudever_dashboard/api/leetcode_api.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/modules/widgets/custom_text_fields.dart';
import 'package:fudever_dashboard/modules/widgets/grid_item.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final _formKey = GlobalKey<FormState>();
  final leetcodeController = TextEditingController();
  late dynamic data=null;
  void getData() async {
    // data = await UserController.getUsers();
    data = await LeetcodeController.getLeaderBoard();
    setState(() {
      data = data['data'];
      // print(data);
      // print();
    });
  }
  bool isNotValid = false;
  void handleSubmission()async {
    dynamic options = {
      "leetcodeUsername": leetcodeController.text
    };
    dynamic res = await LeetcodeController.subscribeLeetcode(options: options);
    if(res['status']=='success'){
      Navigator.of(context).pushReplacementNamed('leader-board');
    }
    print(res);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (builder){
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode()); // Hide keyboard when tapping outside the text field
                  },
                  child: Wrap(
                    children: [
                      Container(
                        color: Colors.white,
                        padding:EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom, // Add bottom padding equal to the keyboard height
                          left: 16,
                          right: 16,
                          top: 8,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomField(
                                title: "Leetcode username",
                                hintText: "Nhập username leetcode của bạn",
                                controller: leetcodeController,
                                isCompulsory: true,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: screenWidth,
                                child: MaterialButton(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                                  onPressed: handleSubmission,
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
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ),
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
          (data==null)?Container():Container(
            width: screenWidth,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopLeaders(
                  name: '${data[1]['userId']['firstname']} ${data[1]['userId']['lastname']}',
                  position: 2,
                  points: data[1]['acSubmissionList'].length*10,
                  avatar: "${data[1]['userId']['avatar']}",
                ),
                TopLeaders(
                  isCenter: false,
                  name: '${data[0]['userId']['firstname']} ${data[0]['userId']['lastname']}',
                  position: 1,
                  points: data[0]['acSubmissionList'].length*10,
                  avatar: "${data[0]['userId']['avatar']}",
                ),
                TopLeaders(
                  name: '${data[2]['userId']['firstname']} ${data[2]['userId']['lastname']}',
                  position: 3,
                  points: data[2]['acSubmissionList'].length*10,
                  avatar: "${data[2]['userId']['avatar']}",
                )
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
              child: (data==null)?Container():ListView.builder(
                itemCount: data.length,
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
                            Text((index>5)?'${index+1}':' ${index+1}'),
                            SizedBox(width: 10,),
                            ClipOval(
                              child: Image.network(
                                "${data[index]['userId']['avatar']}",
                                fit: BoxFit.cover,
                                height: 38, // Ensure this is twice the radius for a complete circle
                                width: 38,  // Ensure this is twice the radius for a complete circle
                              ),
                            ),
                          ],
                        ),
                      ),
                      title: Text('${data[index]['userId']['firstname']} ${data[index]['userId']['lastname']}'),
                      trailing: Text("${data[index]['acSubmissionList'].length*10} pts"),
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
