
import 'package:flutter/material.dart';

class ColorList {

  final Color color;
  const ColorList({required this.color});

}

 const List<ColorList> colorList =  <ColorList>[
   ColorList(color: Colors.redAccent),
   ColorList(color: Colors.yellowAccent),
   ColorList(color: Colors.pinkAccent),

];
