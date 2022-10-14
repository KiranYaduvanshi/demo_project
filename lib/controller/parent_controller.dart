import 'package:demo_flutter_project/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quick_actions/quick_actions.dart';

class ParentController extends GetxController{

  RxList list = [].obs;
  RxList listItem = [].obs;
  RxString shortcut = 'no action set'.obs;
  RxInt selected_index = (-1).obs;
  RxBool selectedBool = false.obs;
  RxBool showList = false.obs;

  RxList checkList = [].obs;
  late ScrollController localityScrollController;



  createList(){
    for(int i =0 ; i<10 ; i++){
      list.add(i);
      print(list[i]);
    }
  }

  @override
  void onInit() {

    localityScrollController = ScrollController(initialScrollOffset: 0);

    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
        if (shortcutType != null) {
          shortcut.value = shortcutType;
        }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      // NOTE: This first action icon will only work on iOS.
      // In a real world project keep the same file name for both platforms.
      const ShortcutItem(
        type: 'action_one',
        localizedTitle: 'Action one',
        icon: 'AppIcon',
      ),
      // NOTE: This second action icon will only work on Android.
      // In a real world project keep the same file name for both platforms.
      const ShortcutItem(
          type: 'action_two',
          localizedTitle: 'Action two',
          icon: 'ic_launcher'),
    ]).then((void _) {
        if (shortcut == 'action_two') {
          shortcut.value = 'actions ready';
          Get.toNamed(AppPages.scrollController);
        }
    });
    createList();
    super.onInit();
  }


  selectedList(int index){

        if(selectedBool == true){
      list.add(index);
    }
    else{
      list.removeAt(index);
    }
  }

}