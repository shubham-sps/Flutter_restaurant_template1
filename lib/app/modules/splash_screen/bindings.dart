import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/splash_screen/controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
