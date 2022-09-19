import 'package:demo_flutter_project/routes/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParallaxController extends GetxController{

  RxString message = "".obs;
  late ScrollController controller ;

  List<String> list = [
    ImagePath.url3,ImagePath.url2,ImagePath.url, ImagePath.url5,
    ImagePath.url2,ImagePath.url,ImagePath.url6

  ];

  @override
  void onInit() {

    controller = ScrollController();
    controller.addListener(scrollListener);

    super.onInit();
  }


  scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
              message.value = "reach the bottom";

    }
    if (controller.offset <= controller.position.minScrollExtent &&
        !controller.position.outOfRange) {
        message.value = "reach the top";
    }
  }



}