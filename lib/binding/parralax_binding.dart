import 'package:demo_flutter_project/controller/parallax_controller.dart';
import 'package:get/get.dart';

class ParralaxBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ParallaxController());
  }
}