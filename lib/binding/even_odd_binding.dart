import 'package:demo_flutter_project/controller/even_odd_controller.dart';
import 'package:get/get.dart';

class EvenOddBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EvenOddController());
  }

}