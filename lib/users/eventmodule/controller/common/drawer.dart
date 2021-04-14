import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonWidgets{
    static var userdata = GetStorage();

  static Container sidebarList(BuildContext context, User user){

    return Container(

      child: ListView(

        children: [
          userAccount(user),
            SizedBox(height: 20,),
          Container(
            margin:EdgeInsets.symmetric(horizontal: 15),

            child: ListTile(
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              trailing: Icon(Icons.dashboard),
              onTap: (){
                Get.toNamed('/admin');
//            Navigator.of(context).pop();
              },
              tileColor: Colors.grey.withOpacity(0.23),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.black,

                ),),
            ),
          ),

          Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              onTap: (){
                Get.toNamed('/edit');
              },
              tileColor: Colors.grey.withOpacity(0.23),
              trailing: Icon(Icons.add_circle),
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.black,

                ),),
            ),
          ),

          Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              onTap: (){
                Get.toNamed('/myAccounts');
//            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateTeacher()));
              },
              tileColor: Colors.grey.withOpacity(0.23),
//          contentPadding: EdgeInsets.symmetric(horizontal: 10),
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              trailing: Icon(Icons.add_circle),
              title: Text(
                'My Account',
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.black,

                ),),
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              onTap: (){

                Get.toNamed('/changePassword');
//            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateTeacher()));
              },
              trailing: Icon(Icons.add_circle),
              tileColor: Colors.grey.withOpacity(0.23),
              title: Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.black,

                ),),
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              tileColor: Colors.grey.withOpacity(0.23),
              onTap: (){
                  userdata.write('isLoggedIn', false);
                  userdata.write('token', '');
                  userdata.write('user', 0);
                Get.toNamed('/');
//            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateTeacher()));
              },
              trailing: Icon(Icons.add_circle),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.black,

                ),),
            ),
          ),
//          textButtons()
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
//      Align(
//        alignment: Alignment.bottomRight,
//        child: GestureDetector(
//
//          child: Container(
//
//            child: Text(
//              "Logout",
//              style: GoogleFonts.macondo(
//                textStyle: TextStyle(
//                  color: Colors.black
//                )
//              ),
//            ),
//          ),
//        ),
//      )
        ],
      ),
    );
  }


  static TextButton textButtons(){
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.grey[200],
//        minimumSize: Size(88, 36),
//        padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),


      ),
      onPressed: (){},

      child:Row(
        children: [
          Icon(Icons.supervised_user_circle, color: Colors.deepOrangeAccent.withOpacity(0.7),),
          SizedBox(width: 20,),
          Expanded(
            child:Text('User',
            style: TextStyle(
              fontSize: 27,
              color: Colors.black
            ),),
          )
        ],
      ),
    );
  }


  static UserAccountsDrawerHeader userAccount(User user){
    return UserAccountsDrawerHeader(
      accountName: Text('${user.username}',style: TextStyle(
        fontSize: 22.0,

      ),),
      accountEmail: Text('${user.email}',style: GoogleFonts.pacifico(
          textStyle: TextStyle(
              fontSize: 24.0,
              color:Colors.white
          )
      )),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
//          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREDoSNa-bR2mY_CTu1uxBpsCJ5_StKSsKqdQ&usqp=CAU'),
           backgroundImage:NetworkImage('http://10.5.226.205:8000/users/images/${user.username}/'),
//          backgroundImage: AssetImage('assets/images/mish.jpg'),
        ),
      ),
      decoration:BoxDecoration(

          image: DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage('assets/images/edtech3.jpg') )
      ) ,
    );
  }


}