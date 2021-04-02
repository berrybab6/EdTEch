import 'package:flutter/material.dart';

class OnBoardPainter extends CustomPainter{
  final BuildContext context;
  final List<Color> colors;
  final ValueNotifier<double> notifier;
  final GlobalKey targetButton;


  RenderBox _renderBox;

  OnBoardPainter({this.context, this.colors, this.notifier, this.targetButton});
  @override
  void paint(Canvas canvas, Size size) {

    final screen = MediaQuery.of(context).size;
    if(_renderBox == null){
      _renderBox = targetButton.currentContext.findRenderObject();
    }
    if(_renderBox == null || notifier == null){
      return ;
    }
    final page = notifier.value.floor();

    final animated = notifier.value - page;
    var animatorVal = Curves.easeInOut.transformInternal(animated);
    final targetPos = _renderBox.localToGlobal(Offset.zero);
    final xScale = screen.height *8 , yScale = xScale/2;

    Paint buttonPaint =Paint(), bgPaint = Paint();
    Rect buttonRect, bgRect = Rect.fromLTWH(0, 0, size.width, size.height);

    if(animatorVal <0.5){
      animatorVal = Curves.easeInOut.transformInternal(animatorVal);
      bgPaint..color=colors[page% colors.length];
      buttonPaint..color = colors[(page + 1) % colors.length];

      buttonRect = Rect.fromLTRB(
      targetPos.dx - (xScale*animatorVal),
      targetPos.dy - (yScale * animatorVal),
      targetPos.dx + _renderBox.size.width + (1-animatorVal),
      targetPos.dy + _renderBox.size.height + (yScale * animatorVal));
    }else{
      bgPaint..color = colors[(page + 1)% colors.length];
      buttonPaint..color = colors[page%colors.length];
      buttonRect = Rect.fromLTRB(
          targetPos.dx + _renderBox.size.width * (1-animatorVal),
          targetPos.dy - yScale * (1-animatorVal),
          targetPos.dx + (_renderBox.size.width) + xScale * (1-animatorVal),
          targetPos.dy + _renderBox.size.height + (yScale * animatorVal));
    }

    canvas.drawRect(bgRect, bgPaint);
    canvas.drawRRect(
    RRect.fromRectAndRadius(buttonRect,Radius.circular(screen.height)),
    buttonPaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
        return true;
  }

}