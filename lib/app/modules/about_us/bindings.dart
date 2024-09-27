import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/about_us/controller.dart';

class InfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InfoController());
  }
}
