import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';
import 'package:restaurant_template/app/modules/reservation/controller.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class ReservationSuccessScreen extends GetView<ReservationController> {
  const ReservationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reservation',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h, top: 30.h),
                child: Text(
                  'Congratulations! Your Booking has been Confirmed',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 0.35.sh,
                      width: 0.8.sw,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image:
                                AssetImage('assets/reservation_confirmed.png'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                    ),
                    Positioned(
                        top: 10.h,
                        left: 20.h,
                        child: Icon(
                          Icons.check_circle_outline_outlined,
                          size: 50.h,
                          color: Colors.green,
                          shadows: [
                            Shadow(color: Colors.green, blurRadius: 10.h)
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              GestureDetector(
                onTap: () {
                  //Get.find<DashboardController>().loadCartValue();
                  Get.offAndToNamed(RouteName.dashboard);
                },
                child: Container(
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: orangeGradient(),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.r),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Back to Home",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
