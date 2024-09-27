import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/reservation/controller.dart';

class ReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReservationController());
  }
}
