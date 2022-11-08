import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:velocity_x/velocity_x.dart';
import 'swipe_controller.dart';


class  TinderSwipe extends StatelessWidget{
  const TinderSwipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SwipeController controller = Get.find();
    return SafeArea(child: Scaffold(
      body: Stack(children: [
      SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: SwipeCards(
        matchEngine: controller.matchEngine!,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: Container(
              alignment: Alignment.center,
              color: controller.swipeItems[index].content.color,
              child: Text(
                controller.swipeItems[index].content.text,
                style: TextStyle(fontSize: 100),
              ),
            ).p(20),
          );
        },
        onStackFinished: () {
          controller.scaffoldKey.currentState!.showSnackBar(const SnackBar(
            content: Text("Stack Finished"),
            duration: Duration(milliseconds: 500),
          ));
        },
        itemChanged: (SwipeItem item, int index) {
          print("item: ${item.content.text}, index: $index");
        },
        upSwipeAllowed: true,
        fillSpace: true,
      ),
      ),
      ]
    ),
    ),
    );

  }
}