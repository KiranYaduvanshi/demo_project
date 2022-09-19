import 'package:demo_flutter_project/controller/parent_controller.dart';
import 'package:demo_flutter_project/ui/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget{
  ParentController controller =Get.find();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        children: [
          "kiran".text.make(),

          Obx(() =>
             SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: controller.list.length,
                  itemBuilder: (BuildContext context , int index){

                return CartItems(index: index,

                ).p(12);

              }),
            ).expand(),
          ),

        ],
      ),
    );
  }

}