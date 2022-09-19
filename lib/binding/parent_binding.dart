import 'package:demo_flutter_project/controller/child_controlleer.dart';
import 'package:demo_flutter_project/controller/parent_controller.dart';
import 'package:get/get.dart';

class ParentBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ParentController());
    Get.lazyPut(() => ChildController());

  }
}