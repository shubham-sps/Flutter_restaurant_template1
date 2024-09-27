import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/after_login/bookings/controller.dart';

class BookingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BookingsController());
  }
}
