import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring_button/spring_button.dart';

class Comment extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<Comment> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: Column(
              children: [
              
                ListTile(
                  leading: GestureDetector(
                    onTap: () async {
                      // Display the image in large form.
                      print("Comment Clicked");
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.all(Radius.circular(50))),
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                    ),
                  ),
                  title: Text(
                    data[i]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(data[i]['message']),
                ),
                
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(


                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text("3k"),
                            IconButton(

                              icon: Icon(Icons.reply, color: Colors.black,size: 20,),
                              onPressed: (){
                                SnackBar(content: Text("Favourite Icon"));
                                print("Favourite Iconnnn");
                              },
                            ),
                          ],
                        ),

                      ),

                      Expanded(


                        child:Row(
                          children: [
                            Text("3.3k"),
                            IconButton(

                              icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.black,size: 20,),
                              onPressed: (){
                                SnackBar(content: Text("Favourite Icon"));
                                print("Favourite Iconnnn");
                              },
                            ),
                          ],
                        ),

                      ),


                      Expanded(


                        child:Row(
                          children: [
                            Text("3.3k"),
                            IconButton(

                              icon: Icon(Icons.thumb_down_outlined, color: Colors.black,size: 20,),
                              onPressed: (){
                                SnackBar(content: Text("Dislike  Icon"));
                                print("Dislike Iconnnn");
                              },
                            ),
                          ],
                        ),),


                    ],
                  ),
                )
              ],
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
//      appBar: AppBar(
//        title: Text("Comment Page", style: TextStyle(color: Colors.white),),
//        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.8),
//      ),
      child: Container(
        child: Stack(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
//        width: MediaQuery.of(context).size.width,
              child: CommentBox(
                userImage:
                "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
                child: commentChild(filedata),
                labelText: 'Write a comment...',
                errorText: 'Comment cannot be blank',
                sendButtonMethod: () {
                  if (formKey.currentState.validate()) {
                    print(commentController.text);
                    setState(() {
                      var value = {
                        'name': 'New User',
                        'pic':
                        'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                        'message': commentController.text
                      };
                      filedata.insert(0, value);
                    });
                    commentController.clear();
                    FocusScope.of(context).unfocus();
                  } else {
                    print("Not validated");
                  }
                },
                formKey: formKey,
                commentController: commentController,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,


              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 30),
                  child: Text(
                    'Comments', style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 30
                  ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  child: SpringButton(

                    SpringButtonType.OnlyScale, //springButtonType


                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 15,
                      child: ClipRRect(

                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child:IconButton(
                            onPressed: (){
                              Get.back();
                            },
                            icon: Icon(Icons.close, size: 15, color: Colors.white,),
                          )
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}