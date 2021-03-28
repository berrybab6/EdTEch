import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Next extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {

  String dropdownValue ="Select your role";
  List<String> spinnerItems = [
    'Select your role',
    'Teacher',
    'Student'
  ] ;

  String departmentSelection = "Select your department";


  List<String> departmentSpinner = [
    'Select your department',
    'Software',
    'Electrical',
    'Mechanical',
    'IT',
    'Biomed',
    'Chemical',
    'Civil'
  ] ;

  String genderSelection = 'select ur gender';
  List<String> genderSpinner = [
    'select ur gender',
    'Female',
    'Male'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Column(
          children: [


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 30.0),
                        padding: EdgeInsets.all(20.0),
//                                     color: Colors.white,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Text("Department",
                          style: TextStyle(
                              fontSize: 26.0,

                              color: Colors.black
                          ),),
                      ),
                    ),
                    Container(
                      color: Colors.grey[200],
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: DropdownButton<String>(
                        value: departmentSelection,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 10,

                        style: TextStyle(
                            color: Colors.black,

                            fontSize: 22),
//                                       underline: Container(
//                                         height: 2,
//                                         color: Colors.black,
//                                       ),
                        onChanged: (String data) {
                          setState(() {
                            departmentSelection = data;
                          });
                        },
                        items: departmentSpinner.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value??""),
                          );
                        }).toList(),
                      ),
                    ),

//            Text('Selected Item = ' + '$dropdownValue' ?? '',
//                style: TextStyle
//                  (fontSize: 22,
//                    color: Colors.black)),
                  ]),
            ),


      Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 30.0, top:20.0),
                        child: Text("Gender",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26.0
                        ),),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(4.0),
                      margin: EdgeInsets.symmetric(horizontal: 40.0),
                      color: Colors.grey[200],
                      child: Center(
                        child: DropdownButton<String>(
                          value: genderSelection,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 24),
                          underline: Container(
                            height: 0.3,
                            color: Colors.grey,
                          ),
                          onChanged: (String data) {
                            setState(() {
                              genderSelection = data;
                            });
                          },
                          items: genderSpinner.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value??""),
                            );
                          }).toList(),
                        ),
                      ),
                    ),


                  ]),



      Column(
//                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 30.0,top: 20.0),
                      child: Text("Role",
                      style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.black,
                      ),),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  color: Colors.grey[200],
                  child: Center(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 24),
                      underline: Container(
                        height: 0.3,
                        color: Colors.grey,
                      ),
                      onChanged: (String data) {
                        setState(() {
                          dropdownValue = data;
                        });
                      },
                      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value??""),
                        );
                      }).toList(),
                    ),
                  ),
                ),

//            Text('Selected Item = ' + '$dropdownValue' ?? '',
//                style: TextStyle
//                  (fontSize: 22,
//                    color: Colors.black)),
              ]),





//
//
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(left: 30, right: 20.0),
//                      child: Container(
//                        child: Text("Gender"),
//                      ),
//                    ),
//                    DropdownButton<String>(
//                      value: genderSelection,
//                      icon: Icon(Icons.arrow_drop_down),
//                      iconSize: 24,
//                      elevation: 16,
//                      style: TextStyle(color: Colors.red, fontSize: 18),
//                      underline: Container(
//                        height: 2,
//                        color: Colors.deepPurpleAccent,
//                      ),
//                      onChanged: (String data) {
//                        setState(() {
//                          genderSelection = data;
//                        });
//                      },
//                      items: genderSpinner.map<DropdownMenuItem<String>>((String value) {
//                        return DropdownMenuItem<String>(
//                          value: value,
//                          child: Text(value??""),
//                        );
//                      }).toList(),
//                    ),
//
////            Text('Selected Item = ' + '$dropdownValue' ?? '',
////                style: TextStyle
////                  (fontSize: 22,
////                    color: Colors.black)),
//                  ]),
//
//              Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.only(left: 30, right: 20.0),
//                  child: Container(
//                    child: Text("Department"),
//                  ),
//                ),
//                DropdownButton<String>(
//                  value: departmentSelection,
//                  icon: Icon(Icons.arrow_drop_down),
//                  iconSize: 24,
//                  elevation: 16,
//                  style: TextStyle(color: Colors.red, fontSize: 18),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),
//                  onChanged: (String data) {
//                    setState(() {
//                      departmentSelection = data;
//                    });
//                  },
//                  items: departmentSpinner.map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value??""),
//                    );
//                  }).toList(),
//                ),
//
////            Text('Selected Item = ' + '$dropdownValue' ?? '',
////                style: TextStyle
////                  (fontSize: 22,
////                    color: Colors.black)),
//              ]),
//
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(left: 30, right: 20.0),
//                    child: Container(
//                      child: Text("Role"),
//                    ),
//                  ),
//                DropdownButton<String>(
//                  value: dropdownValue,
//                  icon: Icon(Icons.arrow_drop_down),
//                  iconSize: 24,
//                  elevation: 16,
//                  style: TextStyle(color: Colors.red, fontSize: 18),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),
//                  onChanged: (String data) {
//                    setState(() {
//                      dropdownValue = data;
//                    });
//                  },
//                  items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value??""),
//                    );
//                  }).toList(),
//                ),
//
////            Text('Selected Item = ' + '$dropdownValue' ?? '',
////                style: TextStyle
////                  (fontSize: 22,
////                    color: Colors.black)),
//              ]),
//            ],
//          ),
//



          ],
        ),
      )
    );
  }


}
