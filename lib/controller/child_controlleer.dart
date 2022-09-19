import 'package:demo_flutter_project/controller/parent_controller.dart';
import 'package:get/get.dart';

class ChildController extends GetxController{
  ParentController controller = Get.find();
  RxInt count = 0.obs;

  @override
  void onInit() {
    print("list data ---  ${controller.list}");
    super.onInit();
  }

  void increment(){
      count.value ++;
  }

  void decrement(){
    count.value --;
  }
}