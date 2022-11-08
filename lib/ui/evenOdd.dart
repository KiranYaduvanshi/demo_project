import 'package:demo_flutter_project/controller/even_odd_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math';


class EvenOddDemo extends StatelessWidget{
  EvenOddController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>
         Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            "${controller.count}".text.black.make().p(10),
            "${controller.count}".text.black.make().p(10),

            SizedBox(
              height: 400,
              child: ListWheelScrollView(
                itemExtent: 150,
                offAxisFraction: 0,
                diameterRatio: 3,
                children: List.generate(
                  50,
                      (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: double.maxFinite,
                      child: Center(child: Text('Index $index')),
                      color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}