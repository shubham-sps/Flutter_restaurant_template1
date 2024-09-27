import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/signup_screen/controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
