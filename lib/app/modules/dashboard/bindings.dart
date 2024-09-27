import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/dashboard/contoller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
