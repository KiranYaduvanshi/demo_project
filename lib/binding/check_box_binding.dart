import 'package:demo_flutter_project/controller/check_box_controller.dart';
import 'package:get/get.dart';

class CheckboxBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CheckBoxController());
  }
}