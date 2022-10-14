import 'package:demo_flutter_project/controller/TransformController.dart';
import 'package:get/get.dart';

class TransformBinding implements  Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TransformController());
  }
}