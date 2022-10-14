import 'package:demo_flutter_project/controller/TransformController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class TransformConatiner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransformController controller = Get.find();
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: controller.animationController.value * 2.0 * math.pi,
              child: child,
            );
          },
          child: AnimatedBuilder(
              animation: controller.animationController2,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  child: Container(
                    // height: 20 - math.sqrt(controller.animationController2.value),
                    // width: math.sqrt(controller.animationController2.value),
                    height: 10,
                    width: 10,
                    color: Colors.black,
                  ),
                  offset: Offset(controller.animationController2.value, 150),
                );
              }),
        ),
      ),
    );
  }
}
