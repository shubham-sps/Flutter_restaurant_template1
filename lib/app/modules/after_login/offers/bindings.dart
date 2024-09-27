import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/after_login/offers/controller.dart';

class OffersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OffersController());
  }
}
