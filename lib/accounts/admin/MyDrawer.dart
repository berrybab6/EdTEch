import 'package:flutter/material.dart';

//import 'package:ed_tech/accounts/auth/admin/models/User.dart';


class MyDrawer extends StatelessWidget {

//  final User user;

//  MyDrawer({this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250.0,
          margin: EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/images/edtech.jpg'),
                  fit: BoxFit.cover
              )
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('mishmish', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, letterSpacing: 1.0),),
              ),

              SizedBox(
                height: 10.0,
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Text('Email', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 1.0, color: Colors.grey[500]),),
              ),
              SizedBox(height: 5.0,),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('mish@gmail.com', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),),
              ),

            ],
          ),
        ),

        ListTile(
          leading: Icon(Icons.event_note, color: Colors.grey[800],),
          title: Text('Users', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, letterSpacing: 1.0, color: Colors.grey[800 ]),),
          onTap: (){
            //TODO: change this
            Navigator.of(context).pushNamed('/');
          },
        ),


        Spacer(),

        ListTile(
          leading: Icon(Icons.logout, color: Colors.deepOrangeAccent,),
          title: Text('Logout', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.75, color: Colors.deepOrange),),
          onTap: (){
//            BlocProvider.of<AuthBloc>(context, listen: false).add(AuthLogout());
          },
        ),

      ],
    );
  }
}