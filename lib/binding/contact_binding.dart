import 'package:demo_flutter_project/controller/contact_controller.dart';
import 'package:get/get.dart';

class ContactBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ContactController());
  }

}