import 'package:ed_tech/resources/resources_module/controller/resourceController.dart';
import 'package:ed_tech/users/eventmodule/controller/common/drawer.dart';
import 'package:ed_tech/resources/resources_module/controller/commentController.dart';

import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:ed_tech/users/eventmodule/views/commonView/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring_button/spring_button.dart';

class ResourcePage extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  ResourceController resContr = Get.put(ResourceController());
  CommentController comContr = Get.put(CommentController());
  List<String> resource_type = [
    "Exams",
    "Lectures",
    "Assignments",
    "Tutorials",
    "Labs"
  ];
  List<String> file_type = ["Video", "Images", "Pdf", "Text"];
  bool _isClicked = false;

  var data = Get.arguments as User;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: CommonWidgets.sidebarList(context, data),
      ),

      appBar: AppBar(
        toolbarHeight: 170,

        title: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Text('Resources',
                  style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  )),
            ),
            Container(
//        margin: EdgeInsets.only(top: 10, left: 10),

                height: 65,
                child: ListView.builder(
                    itemCount: resource_type.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 7,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Stack(
                          children: [
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: 110,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
//                                border: Border.all(color: Color(0xff307B30), width: 1),
                                  color:
                                      _isClicked ? Colors.white : Colors.black,
                                ),
                                child: Text(
                                  resource_type[index],
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: _isClicked
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16)),
                                ),
                              ),
                              onTap: () {
                                setState() {
                                  print("Heyyyy");
                                  _isClicked = true;
                                }
                              },
                            )
                          ],
                        ),
                      );
                    })),
            Container(
//        margin: EdgeInsets.only(top: 10, left: 10),

                height: 45,
                child: ListView.builder(
                    itemCount: file_type.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Stack(
                          children: [
                            GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
//                                border: Border.all(color: Color(0xff307B30), width: 1),
                                    color: _isClicked
                                        ? Colors.white
                                        : Colors.grey[200],
                                  ),
                                  child: Text(
                                    file_type[index],
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: _isClicked
                                                ? Colors.white
                                                : Colors.orange,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16)),
                                  ),
                                ),
                                onTap: () {})
                          ],
                        ),
                      );
                    })),
          ],
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
//        actions: [
//          IconButton(
//            icon: Icon(Icons.search),
//          ),
//          IconButton( icon: Icon(Icons.notifications_active))
//        ],
      ),
//      drawer: Drawer(
//        child: CommonWidgets.sidebarList(context, null),
//      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
//          height: 300,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Obx(() {
                  if (resContr.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: resContr.resList.length,
                    itemBuilder: (context, index) {
                      return Container(
//                      color: Colors.grey[300],
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(children: [
                          SpringButton(
                            SpringButtonType.WithOpacity,
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width * 0.6,
//                          padding: EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/edtech3.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20))
//                                borderRadius: BorderRadius.circular(20.0),
                                      ),
                                  alignment: Alignment.bottomCenter,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20)),

//                            borderRadius: BorderRadius.circular(20.0),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Colors.black,
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            )),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${resContr.resList[index].name}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  'System Programming Exam 2010',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            scaleCoefficient: 0.95,
                            useCache: false,
                            onTap: () {
//                        Navigator.of(context).pushNamed(MyEventDetail.routeName, arguments: myEvents[index]);
                            },
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 12.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text("3.3k"),
                                          IconButton(
                                            icon: Icon(
                                              Icons.favorite_border,
                                              color: Colors.red,
                                              size: 33,
                                            ),
                                            onPressed: () {
                                              SnackBar(
                                                  content:
                                                      Text("Favourite Icon"));
                                              print("Favourite Iconnnn");
                                            },
                                          ),
                                        ],
                                      ),
//                                            Text((myEvents[index].allSeats - myEvents[index].reservedSeats).toString(), style: TextStyle(color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.w700),),
//                                            Text('Seats Available', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w300),),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text('23.4k'),
                                          IconButton(
                                            icon: Icon(
                                              Icons.comment,
                                              size: 33,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
//                                            Get.toNamed('/comment');

                                              comContr.res_id.value =
                                                  resContr.resList[index].id;
                                              comContr.fetchComments();
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Comment();
                                                  });
                                              SnackBar(
                                                  content:
                                                      Text("Download Icon"));
                                              print("Download Iconnnn");
                                            },
                                          ),
                                        ],
                                      ),
//                                            Text((myEvents[index].allSeats - myEvents[index].reservedSeats).toString(), style: TextStyle(color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.w700),),
//                                            Text('Seats Available', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w300),),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.file_download,
                                          color: Colors.green,
                                          size: 33,
                                        ),
                                        onPressed: () {
                                          SnackBar(
                                              content: Text("Download Icon"));

                                          print("Download Iconnnn");
                                        },
                                      ),
                                    )
                                  ]))
                        ]),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
