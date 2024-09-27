import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/onboarding/controller.dart';
import 'package:restaurant_template/app/services/storage/local_storage_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const SizedBox()
            : Stack(
                children: [
                  PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.currentPageIndex.value = index;
                    },
                    children: const [
                      OnbardingPage(
                        title: 'Welcome!',
                        description:
                            'Explore the cusines from around the created by the masters.',
                        onboardingimage:
                            'assets/OnBoarding/Onboarding_Page_1.png',
                      ),
                      OnbardingPage(
                        title: 'Order & Takeout',
                        description:
                            "Order whatever your desires and pickup as per your convinience.",
                        onboardingimage:
                            'assets/OnBoarding/Onboarding_Page_2.png',
                      ),
                      OnbardingPage(
                        title: 'Book a Table',
                        description:
                            'Enjoy with your friends. Book a table or the whole Venue for special ocassion.',
                        onboardingimage:
                            'assets/OnBoarding/Onboarding_Page_3.png',
                      ),
                    ],
                  ),
                  Positioned(
                    top: 30.h,
                    right: 20.w,
                    child: TextButton(
                      onPressed: () {
                        controller.skipPage();
                        LocalStorageService.writeValue(
                            key: "firstTimeOpen", value: false);
                      },
                      child: Text('Skip',
                          style: TextStyle(
                            fontSize: 12.h,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 45.h,
                    left: 30.h,
                    child: SmoothPageIndicator(
                      controller: controller.pageController,
                      count: 3,
                      onDotClicked: controller.dotClickNavigation,
                      effect: ExpandingDotsEffect(
                        dotHeight: 6.h,
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 25.h,
                      right: 20.h,
                      child: IconButton(
                          onPressed: () {
                            controller.nextPage();
                          },
                          icon: Icon(
                            Icons.arrow_circle_right,
                            color: Colors.white,
                            size: 40.h,
                          )))
                ],
              ),
      ),
    );
  }
}

class OnbardingPage extends StatelessWidget {
  const OnbardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.onboardingimage,
  });

  final String title;
  final String description;
  final String onboardingimage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.h),
      child: Column(
        children: [
          SizedBox(height: 0.2.sh),
          Image(
            height: 0.4.sh,
            width: 0.8.sw,
            image: AssetImage(onboardingimage),
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 5.h),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14.sp,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
