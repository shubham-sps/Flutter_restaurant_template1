import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Get.offAndToNamed(RouteName.onboarding),
    );
    super.onInit();
  }
}
