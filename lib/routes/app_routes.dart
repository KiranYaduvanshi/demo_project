import 'package:demo_flutter_project/binding/parent_binding.dart';
import 'package:demo_flutter_project/binding/parralax_binding.dart';
import 'package:demo_flutter_project/ui/home_page.dart';
import 'package:demo_flutter_project/routes/app_pages.dart';
import 'package:demo_flutter_project/ui/scroll_controller.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../ui/parralalx_demo.dart';

class AppRoutes{
  static String initalRoutes = AppPages.scrollController;
  static final routes = [
    GetPage(name: AppPages.homePage, page: () => HomePage(),binding: ParentBinding()),
    GetPage(name: AppPages.parralaxDemo, page: () => ParrallaxDemo(),binding: ParralaxBinding()),
    GetPage(name: AppPages.scrollController, page: () => ScrollControllerDemo(),binding: ParralaxBinding()),
  ];
}