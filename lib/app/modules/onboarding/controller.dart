import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';
import 'package:restaurant_template/app/services/storage/local_storage_service.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    // check if first time or not
    bool? isFirstTime = await LocalStorageService.readValue("firstTimeOpen");
    if (isFirstTime != null && !isFirstTime) {
      Get.offAndToNamed(RouteName.dashboard);
    }
    super.onInit();
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      LocalStorageService.writeValue(key: "firstTimeOpen", value: false);
      Get.offAndToNamed(RouteName.login);
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeIn,
      );
    }
  }

  void updateIndicator(index) {
    currentPageIndex.value = index;
  }

  void dotClickNavigation(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeIn,
    );
  }

  void skipPage() {
    // currentPageIndex.value = 2;
    // pageController.animateToPage(
    //   currentPageIndex.value,
    //   duration: const Duration(milliseconds: 750),
    //   curve: Curves.easeIn,
    // );
    Get.offAndToNamed(RouteName.login);
  }
}
