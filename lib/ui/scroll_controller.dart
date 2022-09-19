import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/parallax_controller.dart';

class ScrollControllerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ParallaxController controller = Get.find();


    return SafeArea(child:   Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            child: Obx(() =>
               Center(
                child: "${controller.message.value} ".text.bold.size(24).make(),
              ),
            ),
          ),
          SizedBox(
              height: 500,
              child: ListView.builder(
                controller: controller.controller,
                  itemCount: controller.list.length,
                  itemBuilder: (BuildContext context, int index){
                    return  SizedBox(
                        height: 180,
                        child: Image.network("${controller.list[index]}",fit: BoxFit.fill,)).p(10);
                  })
          ).expand(),
        ],
      ),

    ));
  }

}