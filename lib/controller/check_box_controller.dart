import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  RxList list = [].obs;
  RxList selectedList = [].obs;
  RxBool selected = false.obs;

  RxMap details ={1:0,2:1,
    3:2,4:3,5:4,
  }.obs;
  RxList mapList = [].obs;

  initializList() {
    details.forEach((key, value) {
      print("map values $value");

    });

    for (int i = 0; i <= 10; i++) {
      list.add(i);
    }
  }

  @override
  void onInit() {
    mapList.value = details.entries.toList();

    for(int i =0 ; i<mapList.value.length; i++){
      print("list data --- > ${mapList.value[i].key}");
    }

   // initializList();
    super.onInit();
  }

  mapSelectCheckBox(int index) {
    if(mapList.value[index].key.contains(index)){
      mapList.removeAt(index);
      selected.value = false;

      print("remove from list data ${selectedList}");

    }
    else{
      mapList.add(index);
      selected.value = true;
      print("add  to list data ${selectedList}");

    }

  }

  selectCheckBox(int index) {
    if(selectedList.contains(index)){
      selectedList.removeAt(index);
      selected.value = false;

      print("remove from list data ${selectedList}");

    }
    else{
      selectedList.add(index);
      selected.value = true;
      print("add  to list data ${selectedList}");

    }

    // if (selectedList.contains(index)) {
    //   selectedList.remove(index);
    //   print("removed");
    // } else {
    //   print("added");
    //   // selectedList.replaceRange(index);
    //   selectedList.add
    // }
    //
    // print(selectedList);
  }

}
