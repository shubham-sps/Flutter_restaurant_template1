import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/onboarding/controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
  }
}
