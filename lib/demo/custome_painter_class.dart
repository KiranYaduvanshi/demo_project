import 'package:flutter/material.dart';

class RectanglePainter extends CustomPainter {
  bool? isFilled;
  RectanglePainter( {this.isFilled});

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint();
    print("width ---- ${size.width}");
    print("hwight ---- ${size.height}");
    Rect rect = Rect.fromCenter(center: Offset(size.width * 0.5 , size.height * 0.9), width: 50, height: 50);

 //   canvas.drawCircle(Offset(size.width * 0.5 , size.height * 0.9), 50, paint);
    canvas.drawArc(rect, 0.5, 5, isFilled!, paint);
    //canvas.drawOval(rect, paint);
    // canvas.drawArc( Rect.fromLTWH(0.0, 0.0, size.width/2, size.height/2),
    //     0.175, 0.349, false, paint);


    // Paint paint = Paint();
    // paint.color = Colors.blue;
    // if(isFilled != null){
    //   paint.style = PaintingStyle.fill;
    // }
    // else {
    //   paint.style = PaintingStyle.stroke;
    // }
    // paint.strokeCap = StrokeCap.round;
    // paint.strokeJoin = StrokeJoin.round;
    // paint.strokeWidth = 5;
    // Offset offset = Offset(size.width * 0.5, size.height);
    //
    // Rect rect = Rect.fromCenter(center: offset, width: 50, height: 50);
    // canvas.drawRect(rect, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    //throw UnimplementedError();
  }

}
