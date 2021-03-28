import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';

import 'package:ed_tech/users/eventmodule/views/createStudent.dart';
import 'package:ed_tech/users/eventmodule/views/createTeacher.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.0,
          backgroundColor: Colors.black,
          title: Center(child: Text(
              'Home',
              style:TextStyle(
                fontSize: 33.0,
              )
          ),),
        ),
        drawer: Drawer(

            child: sidebarList(),
        ),
        body: Container(
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15,),
//                  color: Colors.deepOrangeAccent,
                child: Text(
                  'View Users',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Expanded(
                   child: Padding(padding: EdgeInsets.only(left: 10.0),
                   child: buildDashboard('View Students', 1),
                   ),
                 ),
                  Expanded(
                    child: Padding(padding: EdgeInsets.only(left: 10.0),
                      child: buildDashboard('View Teachers', 2),
                    ),
                  )
                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15,),
//                  color: Colors.deepOrangeAccent,
                child: Text(
                  'Register Users',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(padding: EdgeInsets.only(left: 10.0),
                      child: buildDashboard('Add Student', 1),
                    ),
                  ),
                  Expanded(
                    child: Padding(padding: EdgeInsets.only(left: 10.0),
                      child: buildDashboard('Add Teacher', 2),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SpringButton buildDashboard(String name, int role) {
    return SpringButton(
      SpringButtonType.OnlyScale,
      Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8.0),
          ),
          width:220,
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Center(
            child: Text(name, style: TextStyle(fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5),),
          )
      ),
      scaleCoefficient: 0.9,
      useCache: false,
      onTap: () {
        if (role == 1) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (contect) => CreateStudent()));
        } else if (role == 2) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateTeacher()));
        } else {
          Navigator.of(context).pushNamed('/sidebar');
        }
      },
    );
  }



  UserAccountsDrawerHeader userAccount(){
    return UserAccountsDrawerHeader(
        accountName: Text('mishmish'),
        accountEmail: Text('mish@gmail.com'),
        currentAccountPicture: GestureDetector(
          child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/mish.jpg'),
          ),
        ),
        decoration:BoxDecoration(

          image: DecorationImage(
            fit: BoxFit.cover,
              image:AssetImage('assets/images/edtech3.jpg') )
        ) ,
    );
  }


  ListView sidebarList(){

    return ListView(
      children: [
        userAccount(),

        ListTile(
          trailing: Icon(Icons.dashboard),
          onTap: (){
            Navigator.of(context).pop();
          },
          title: Text(
            'Dashboard',
          style: TextStyle(
            fontSize: 23.0,
            color: Colors.black,

          ),),
        ),

          Divider(),
        ListTile(
          trailing: Icon(Icons.add_circle),
          title: Text(
            'Add Student',
            style: TextStyle(
              fontSize: 23.0,
              color: Colors.black,

            ),),
        ),

          Divider(),
        ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateTeacher()));
          },
          trailing: Icon(Icons.add_circle),
          title: Text(
            'Add Teacher',
            style: TextStyle(
              fontSize: 23.0,
              color: Colors.black,

            ),),
        ),
//
//        ListTile(
//          trailing: Icon(Icons.close),
//          title: Text(
//            'Close',
//            style: TextStyle(
//              fontSize: 23.0,
//              color: Colors.black,
//
//            ),),
//        ),
      ],
    );
  }
}
