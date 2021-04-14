import 'dart:ui';
import 'package:ed_tech/accounts/admin/adminpage.dart';
import 'package:ed_tech/resources/resources_module/views/ResourcePage.dart';
import 'package:ed_tech/users/eventmodule/views/admin/adminhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

const items = [
  Color(0xccc55500),
  Color(0xffff9100),
  Color(0xff00695c),
//  Color(0xdfff7000),
  Color(0xff37474f),
  Color(0xff909090),
];

const titles = [
  'Ed_Tech',
  'Share Video',
  'Access Resource',
  "Save Todo",
  'Friendly'
];

const descriptions = [
  'Ed_Tech is an online resource that enables learning and improves performance, typically in educational and corporate environments to inform and engage learners',
  'Ed_Tech can offer effective mechanism to share videos and Other Tutorial ',
    'Users can access resources will be helpful for them.And they Can save Shared Resources and can get access to it later',
  'Users can be able to keep track of personnal diary and Can take Personnal notes in here',
  'friendly'
];

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  ValueNotifier<double> _notifier = ValueNotifier(0.0);
  final _button = GlobalKey();
  final _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      _notifier.value = _pageController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _notifier.dispose();
    super.dispose();
  }
  var userData = GetStorage();
  @override
  Widget build(BuildContext context) {

    if(userData.read('isLoggedIn')) {
      if (userData.read('user') == 1) {
        return AdminHome();
      } else if (userData.read('user') == 2 || userData.read('user') == 3) {
        return ResourcePage();
      }
    }
    else {
      return (userData.read("isLoggedIn")) ? ResourcePage() : Scaffold(
        body: Stack(
            children: [

              // Custom Painter
              AnimatedBuilder(
                animation: _notifier,
                builder: (_, __) =>
                    CustomPaint(
                      painter: FlowPainter(
                        context: context,
                        notifier: _notifier,
                        target: _button,
                        colors: items,
                      ),
                    ),
              ),


              // PageView
              PageView.builder(
                controller: _pageController,
                itemCount: items.length,
                itemBuilder: (c, i) =>
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: edTechText(titles[i], descriptions[i]),
                      ),
                    ),
              ),


              // Anchor Button
              IgnorePointer(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: ClipOval(
                      child: AnimatedBuilder(
                        animation: _notifier,
                        builder: (_, __) {
                          final animatorVal =
                              _notifier.value - _notifier.value.floor();
                          double opacity = 0,
                              iconPos = 0;
                          int colorIndex;
                          if (animatorVal < 0.5) {
                            opacity = (animatorVal - 0.5) * -2;
                            iconPos = 80 * -animatorVal;
                            colorIndex = _notifier.value.floor() + 1;
                          } else {
                            colorIndex = _notifier.value.floor() + 2;
                            iconPos = -80;
                          }
                          if (animatorVal > 0.9) {
                            iconPos = -250 * (1 - animatorVal) * 10;
                            opacity = (animatorVal - 0.9) * 10;
                          }
                          colorIndex = colorIndex % items.length;
                          return SizedBox(
                            key: _button,
                            width: 80,
                            height: 80,
                            child: Transform.translate(
                              offset: Offset(iconPos, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: items[colorIndex],
                                ),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white.withOpacity(opacity),
                                  size: 30,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  width: 3 * (MediaQuery
                      .of(context)
                      .size
                      .width) / 4,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: Text("Get Started",
                      style: TextStyle(fontSize: 30, color: Colors.black),),
                  ),
                ),
              )

            ]
        ),
      );
    }
  }


  Column edTechText(String title, String desc) {
    return Column(

      children: [

        Text(
          '$title',
          style: GoogleFonts.playfairDisplay(
              textStyle:TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900
              )
          ),
        ),

        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '$desc .',
            style:GoogleFonts.lato(textStyle: TextStyle(
              fontSize: 27,
              wordSpacing: 1.2,

              color: Colors.white,
//                          fontWeight: FontWeight.w900,
            )),
            textAlign: TextAlign.center,
          ),
        ),


      ],
    );
  }
}

class FlowPainter extends CustomPainter {
  final BuildContext context;
  final ValueNotifier<double> notifier;
  final GlobalKey target;
  final List<Color> colors;

  RenderBox _renderBox;

  FlowPainter({this.context, this.notifier, this.target, this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final screen = MediaQuery.of(context).size;
    if (_renderBox == null)
      _renderBox = target.currentContext.findRenderObject();
    if (_renderBox == null || notifier == null) return;
    final page = notifier.value.floor();
    final animatorVal = notifier.value - page;
    final targetPos = _renderBox.localToGlobal(Offset.zero);
    final xScale = screen.height * 8, yScale = xScale / 2;
    var curvedVal = Curves.easeInOut.transformInternal(animatorVal);
    final reverseVal = 1 - curvedVal;

    Paint buttonPaint = Paint(), bgPaint = Paint();
    Rect buttonRect, bgRect = Rect.fromLTWH(0, 0, screen.width, screen.height);

    if (animatorVal < 0.5) {
      bgPaint..color = colors[page % colors.length];
      buttonPaint..color = colors[(page + 1) % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx - (xScale * curvedVal), //left
        targetPos.dy - (yScale * curvedVal), //top
        targetPos.dx + _renderBox.size.width * reverseVal, //right
        targetPos.dy + _renderBox.size.height + (yScale * curvedVal), //bottom
      );
    } else {
      bgPaint..color = colors[(page + 1) % colors.length];
      buttonPaint..color = colors[page % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx + _renderBox.size.width * reverseVal, //left
        targetPos.dy - yScale * reverseVal, //top
        targetPos.dx + _renderBox.size.width + xScale * reverseVal, //right
        targetPos.dy + _renderBox.size.height + yScale * reverseVal, //bottom
      );
    }

    canvas.drawRect(bgRect, bgPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(buttonRect, Radius.circular(screen.height)),
      buttonPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
