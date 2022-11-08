import 'package:get/get.dart';

import 'api_controller.dart';

class ApiBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApiController());
  }
}