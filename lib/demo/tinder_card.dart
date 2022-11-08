import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TinderCard extends StatefulWidget {
  final String imageUrl;
  const TinderCard({Key? key,required this.imageUrl}) : super(key: key);


  @override
  TinderCardState createState() => TinderCardState();
}
  class  TinderCardState extends State<TinderCard>{
  @override
  Widget build(BuildContext context) {

      return SizedBox(
        child: buildWidget(),

      ).expand();
  }
   Widget buildWidget(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(widget.imageUrl),fit: BoxFit.cover)
        ),
      ),
    );
   }


}