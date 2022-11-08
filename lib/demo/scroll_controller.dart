import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollViewController extends GetxController{
  late ScrollController controller;
  RxDouble val = 0.0.obs;

  @override
  void onInit() {
    controller = ScrollController(initialScrollOffset: 1);
    controller.addListener(() {
      print(controller.offset);
      val.value = controller.offset;
    });
   // print(controller.position);
    super.onInit();
  }

  _scrollListener() {
    // if (controller.offset >= controller.position.maxScrollExtent &&
    //     !controller.position.outOfRange) {
    //           print("Reach the Bottom");
    // }
    // if (controller.offset <= controller.position.minScrollExtent &&
    //     !controller.position.outOfRange) {
    //     print("Reach the Top");
    // }
  }


}