import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/menu/controller.dart';

class MenuBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MenuBookController());
  }
}
