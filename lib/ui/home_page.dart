import 'package:demo_flutter_project/controller/parent_controller.dart';
import 'package:demo_flutter_project/ui/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget{
  ParentController controller =Get.find();
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: const Text('AB'),
              ),
              label: const Text('Aaron Burr'),
            ),

            GestureDetector(
                onTap: (){
                  controller.showList.value = !controller.showList.value;

                },
                child:
                Obx(() => controller.showList.value ?"Show Less".text.make(): "Show More ".text.make())),
            Obx(() =>
              AnimatedContainer(
                height: controller.showList.value
                    ? Get.height * .8 - 300
                    : 125,
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
                child: SingleChildScrollView(
                  controller: controller.localityScrollController,
                  physics: controller.showList.value
                      ? PageScrollPhysics()
                      : NeverScrollableScrollPhysics(),
                  child: Wrap(
                    children: [
                      for (int i=0; i< 10; i++)
                        showListData()
                    ],
                  ),
                ),
              ),
            ),





            "kiran".text.make(),

            Obx(() =>
               SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: controller.list.length,
                    itemBuilder: (BuildContext context , int index){

                  return checkBoxList(index,).p(12);

                }),
              ).expand(),
            ),

          ],
        ),
      ),
    );
  }

  Widget checkBoxList(int index){
    return  GestureDetector(
        onTap: (){
          //controller.selected_index.value = index;
          controller.selectedBool.value = !controller.selectedBool.value;
          controller.selectedList(index);

        },
        child: Row(
          children: [
            Container(
              child:  Center(
                child: controller.selectedBool == true
                    ? Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
              ),
            ),

            "$index ".text.make().px(20)

          ],
        ),

    );
  }

  Widget showListData(){
    return             SingleChildScrollView(
      child: SizedBox(
        width: Get.width * 1 - 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            "Category".text.size(18).semiBold.make().p4().py8(),
            Wrap(
              children: [
                for(int i =0 ; i< 10 ; i++)
                  UnconstrainedBox(
                    child: Container(
                      constraints:
                      BoxConstraints(maxHeight: 45, minHeight: 45, minWidth: 100),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color:  Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color:  Colors.grey.shade700,
                              width:  1.5)),
                      child: "data"
                          .text
                          .size(14)
                          .maxLines(1)
                          .overflow(TextOverflow.ellipsis)
                          .make()
                          .px12(),
                    ).p8(),
                  ),
              ],
            ),

          ],
        ),
      ),
    );

  }

}