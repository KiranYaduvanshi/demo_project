import 'package:get/get.dart';

class ParentController extends GetxController{

  RxList list = [].obs;

  createList(){
    for(int i =0 ; i<10 ; i++){
      list.add(i);
      print(list[i]);
    }
  }

  @override
  void onInit() {
    createList();
    super.onInit();
  }

}