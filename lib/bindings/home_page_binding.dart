import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

import '../controllers/page_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
