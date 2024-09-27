import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/login_screen/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
