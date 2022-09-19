import 'package:demo_flutter_project/controller/child_controlleer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CartItems extends StatelessWidget{

  final int index;
  CartItems({Key? key,required this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChildController controller = Get.put(ChildController(),tag: "$index");
    return
       Center(
        child: SizedBox(
          height: 100,
          width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              InkWell(
                onTap: (){
                  controller.decrement();
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey.shade200
                  )]),
                    child: "-".text.size(35).make().px(10)).px(8),
              ),
              Obx(()=>
                 Container(
                    height: 40,
                     alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(
                        blurRadius: 4,
                        color: Colors.grey.shade200
                    )]),

                    child: "${
                    controller.count.value
                    }".text.size(25).bold.make().px(10)),
              ),
              InkWell(
                onTap: (){
                     controller.increment();
                },
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(
                        blurRadius: 4,
                        color: Colors.grey.shade200
                    )]),
                    child: "+".text.size(30).make().px(10)).px(10),
              )
            ],
          ),
        ),
       );
  }

}