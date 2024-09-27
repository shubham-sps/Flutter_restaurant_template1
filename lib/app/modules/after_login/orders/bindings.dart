import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/after_login/orders/controller.dart';

class OrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersController());
  }
}
