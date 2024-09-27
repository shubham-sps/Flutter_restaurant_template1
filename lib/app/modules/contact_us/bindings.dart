import 'package:get/get.dart';

import 'package:restaurant_template/app/modules/contact_us/controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContactController());
  }
}
