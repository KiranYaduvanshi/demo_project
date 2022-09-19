import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parallax/parallax.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/parallax_controller.dart';

class ParrallaxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ParallaxController controller = Get.find();
    return Scaffold(
      body: Column(
        children: [


          NotificationListener<ScrollNotification>(
            onNotification: (notification){
              print("${notification}");
              if(notification is ScrollStartNotification){
                print("Notification started");

              }
              else if(notification is ScrollUpdateNotification){
                print("Notification updated ");

              }

              else if(notification is ScrollEndNotification){
                print("Notification End ");

              }
              return true;

            },
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: controller.list.length,
                  itemBuilder: (BuildContext context, int index){
                return  SizedBox(
                  height: 180,
                    

                    child: Image.network("${controller.list[index]}",fit: BoxFit.fill,)).p(10);
              })
            ).expand(),
          )

        ],
      ),
    );
  }
}