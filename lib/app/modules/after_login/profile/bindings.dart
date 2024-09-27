import 'package:get/get.dart';

import 'package:restaurant_template/app/modules/after_login/profile/controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
