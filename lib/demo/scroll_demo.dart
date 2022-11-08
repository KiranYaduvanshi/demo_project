import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'custome_painter_class.dart';
import 'scroll_controller.dart';

class ScrollControllerDemo extends StatelessWidget {
  ScrollViewController viewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => Visibility(
                visible: viewController.val.value < 150 ? true : false,
                child: AnimatedContainer(
                  width: Get.width * .9,
                  height: viewController.val.value < 150 ? 100 : 300,
                  duration: Duration(seconds: 2),
                  color: viewController.val.value < 150
                      ? Colors.amberAccent
                      : Colors.greenAccent,
                  child: Center(
                      child: "${viewController.val.value}"
                          .text
                          .black
                          .extraBold
                          .make()
                          .p(10)),
                ),
              ),
            ),
            Container(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade400),
                      child: CustomPaint(
                        painter: RectanglePainter(isFilled: true),
                        child: const Center(
                          child: Text(
                            'Once upon a time...',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),

                    );
                  }),
            ),
            CustomPaint(
              painter: RectanglePainter(isFilled: false),
              child:  const Center(
                child: Text(
                  'Once upon a time...',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.pink,
                  ),
                ),
              ),
            ),

            CustomPaint(
              painter: RectanglePainter(isFilled: true),
              size:Size(200, 200) ,
              child:  const Center(
                child: Text(
                  'Once upon a time...',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.pink,
                  ),
                ),
              ),
            ).p(18),



            Visibility(
              visible: false,
              child: SizedBox(
                height: 400,
                child: ListView.builder(
                  controller: viewController.controller,
                  itemCount: 30,
                  // itemExtent: itemSize,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("Index : $index"));
                  },
                ),
              ).expand(),
            ),
          ],
        ),
      ),
    );
  }
}
