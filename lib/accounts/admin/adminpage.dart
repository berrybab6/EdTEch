import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.0,
          backgroundColor: Colors.deepOrangeAccent,
          title: Center(child: Text(
            'Admin Home',
            style:TextStyle(
              fontSize: 33.0,
            )
          ),),
        ),
        body: Container(
          child: Center(
            child: Text(
              'Admin Home'
                  //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AdminPage()))
            ),
          ),
        ),
      ),
    );
  }
}
