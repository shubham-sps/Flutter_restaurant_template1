import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/cart/controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
