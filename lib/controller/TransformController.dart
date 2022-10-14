import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class TransformController extends GetxController with GetTickerProviderStateMixin{

  late final AnimationController animationController = AnimationController(
    lowerBound: 0.0,
    upperBound: 4.0,
    duration: const Duration(milliseconds: 200),
    vsync: this,
  )..repeat(min: 0 , max: 4 , reverse: false);

  late final AnimationController animationController2 = AnimationController(
    lowerBound: 0.0,
    upperBound: 50.0,
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat(min: 0 , max: 50 , reverse: true);


}