import 'package:flutter/material.dart';
class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            painter: HeaderContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(

                  padding: EdgeInsets.all(20),
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,

                    ),
                ),
              ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(
                  top: 20
                ),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:NetworkImage('http://10.5.226.205:8000/users/images/mish/')
                  )
                ),
              )
            ],
          ),

          Padding(padding: EdgeInsets.only(bottom: 280, left:174),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              icon: Icon(Icons.camera_alt, color:Colors.white,),
              onPressed: (){},
            ),
          ),)
        ],
      )
    );
  }
  
}

class HeaderContainer extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color=Colors.black;
    Path path = Path()
    ..relativeLineTo(0,200)
      ..quadraticBezierTo((size.width)/2, 250, size.width, 200)
      ..relativeLineTo(0,-200)
    ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}
