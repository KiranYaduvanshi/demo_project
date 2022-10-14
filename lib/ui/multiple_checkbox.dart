import 'package:demo_flutter_project/controller/check_box_controller.dart';
import 'package:demo_flutter_project/routes/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MultipleCheckBox extends StatelessWidget {
  CheckBoxController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Image.network(ImagePath.url),
        ),
        body: Column(
          children: [
             ListTile(
              leading: Image.network(ImagePath.url),
              title: const Text(
                'GFG title',
                textScaleFactor: 1.5,
              ),
              trailing: Icon(Icons.done),
              subtitle: Text('This is subtitle'),
              selected: true,
            ),
            ElevatedButton(onPressed: (){}, child: "Like".text.make()),
            ElevatedButton(onPressed: (){}, child: "Dislike".text.make()),
            ElevatedButton(onPressed: (){}, child: "Super Like".text.make()),

            Scrollbar(
              thickness: 8,
              isAlwaysShown: true,
              trackVisibility: true,
              child: Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.details.length,
                    itemBuilder: (BuildContext context, int index) {
                      return listItems(controller.mapList[index].value, index);
                    }),
              ),
            ).expand()
          ],
        ),
      ),
    );
  }

  Widget listItems(int value, int index) {
    return Container(
      child: Row(
        children: [
          InkWell(
              onTap: () {
                controller.selectCheckBox(index);
              },
              child: Icon(
                Icons.check_box_outline_blank_outlined,
                size: 30,
              )),
          "${value}".text.bold.make().px(20),
        ],
      ).p(8),
    ).p(10);
  }
}
