import 'package:ed_tech/users/eventmodule/controller/LoginController.dart';
import 'package:ed_tech/users/eventmodule/controller/userController.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';


// ignore: must_be_immutable
class UserListView extends StatelessWidget {
//  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  UserController userController = Get.put(UserController());
  final LoginController _loginController = Get.find();
  var userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    print("${_loginController.emailLController.text}");
    return (userdata.read('isLoggedIn'))?Scaffold(
        appBar: AppBar(
          title: Center(child: Text(
            'Users: ${_loginController.emailLController.text}',style: TextStyle(
            color: Colors.white,
            fontSize: 33.0,
            fontWeight: FontWeight.bold
          ),
          ),),
          toolbarHeight: 100,

          
          backgroundColor: Colors.deepOrange.withOpacity(0.6),

        ),
        body: Container(
//          color:Colors.black,
          color: Colors.deepOrangeAccent.withOpacity(0.8),
          alignment: Alignment.center,
          child: Obx((){
          if(userController.isLoading.value){
            return Center(child: CircularProgressIndicator(),);
          }else{
          return ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index){
              return SimpleFoldingCell.create(
//                key: _foldingCellKey,
                frontWidget: _buildFrontWidget(index, userController.userList[index]),
                innerWidget: _buildInnerWidget(index, userController.userList[index]),
                cellSize: Size(MediaQuery.of(context).size.width, 116),
                padding: EdgeInsets.all(10),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
                onOpen: () => print('open opened'),
                onClose: () => print('close closed'),
              );
            },

          );}}




        ),
      ),
      ):Login();

  }

  Widget _buildFrontWidget(int index, User user) {
    return Builder(

        builder: (BuildContext context) {
          return GestureDetector(
            onTap: (){
              final foldingCellState = context
                  .findAncestorStateOfType<SimpleFoldingCellState>();
              foldingCellState?.toggleFold();
            },
//      _foldingCellKey?.currentState?.toggleFold(),
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 27,
                        backgroundImage:NetworkImage('http://10.5.226.205:8000/users/images/${user.username}/')
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Container(

//                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${user.full_name}",
                      style: GoogleFonts.aldrich(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(

                    child: Text(
                      (user.gender!=null)?'${user.gender}':"",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  )

                ],
              ),
            ),
          );
        }
    );
  }

  Widget _buildInnerWidget(int index, User user) {
    return Builder(

        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 11),
            child: Column(

              children: [
                Expanded(
                  child: GestureDetector(
                    child: CircleAvatar(
                      radius: 41,
                      backgroundImage:NetworkImage('http://10.5.226.205:8000/users/images/${user.username}/'),
                    ),
                  ),
                ),
                SizedBox(height: 11.0,),
                Expanded(
                  child: Align(
//            alignment: Alignment.topCenter,
                    child: Text(
                      "${user.full_name}",
                      style: GoogleFonts.aldrich(
                        color: Colors.black,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 11.0,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Software Engineering ",
                      style: GoogleFonts.aldrich(
                        color: Colors.black,
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 11.0,),
                Expanded(
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Batch : 2011',
                        style: TextStyle(
                          fontSize: 23.0,
                          color: Colors.black,
                        ),

                      ),
                      Text(
                        (user.gender != null)?'Female':"",
                        style: TextStyle(
                          fontSize: 23.0,
                          color: Colors.black,
                        ),

                      ),

                    ],
                  ),
                ),

                // GestureDetector(
                //  child: TextButton(

                //),

                Positioned(
                  right: 11,
                  bottom: 11,
                  child: TextButton(
                    onPressed: () {
                      final foldingCellState = context
                          .findAncestorStateOfType<SimpleFoldingCellState>();
                      foldingCellState?.toggleFold();
                    },
                    //=> _foldingCellKey?.currentState?.toggleFold(),
//              child: Text(
//                "^",
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 27,
//                ),
//              ),
                    child: Icon(
                      Icons.arrow_drop_up,
                      color: Colors.red,
                      size: 41,
                    ),
                    style: TextButton.styleFrom(
//              backgroundColor: Colors.deepOrangeAccent,
                      minimumSize: Size(31, 30),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}