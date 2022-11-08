import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipeController extends GetxController{
  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<String> names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink"
  ];
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink
  ];

  @override
  void onInit() {
    for (int i = 0; i < names.length; i++) {
      swipeItems.add(SwipeItem(
          content: Content(text: names[i], color: colors[i]),
          likeAction: () {
            scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Liked ${names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Nope ${names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Superliked ${names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    matchEngine = MatchEngine(swipeItems: swipeItems);

    super.onInit();
  }


}
class Content {
  final String text;
  final Color color;

  Content({required this.text, required this.color});
}

