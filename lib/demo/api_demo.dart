import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'api_controller.dart';

class ApiDemo extends StatelessWidget {
  ApiController controller = Get.find();
  List<Color> colorsList = [Colors.redAccent,Colors.yellowAccent,Colors.pinkAccent];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: "API DEMO".text.make(),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => SingleChildScrollView(

            child: Column(
              children: [
                "${controller.getdata.value.id}".text.bold.make(),
                "${controller.getdata.value.userId}".text.bold.make(),
                "${controller.getdata.value.completed}".text.bold.make(),
                "${controller.getdata.value.title}".text.bold.make(),
                const SelectableText(
                  "Hello Flutter Developer ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                  toolbarOptions: ToolbarOptions(copy: true, selectAll: false),
                ),
                TextField(
                  maxLines: 12,
                  decoration: InputDecoration(
                    hintText: "enter info",
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  )),
                ).p(10),
                SizedBox(
                  height: 500,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: colorsList.length,
                      itemBuilder: (BuildContext context, int index){return Container(
                        height: 300,
                        color: colorsList[index],
                      );}),
                ),

              DotsIndicator(
                dotsCount: colorsList.length,
                position: controller.currentPage.value,
                decorator: const DotsDecorator(
                  color: Colors.black87, // Inactive color
                  activeColor: Colors.redAccent,
                ),
              ),


                Obx(
                  () => SizedBox(
                    height: 500,
                    child: ListView.builder(
                        itemCount: controller.dataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(blurRadius: 3, color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: "${controller.dataList[index].title}"
                                    .text
                                    .make()
                                    .px(6)),
                          ).p(10);
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
