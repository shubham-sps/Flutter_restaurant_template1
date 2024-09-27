import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/after_login/bookings/controller.dart';

class OffersScreen extends GetView<BookingsController> {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 20.h,
                  color: Colors.white,
                ),
              ),
              Text(
                'Offers',
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
              SizedBox(width: 30.w),
            ],
          ),
          SizedBox(height: 120.h),
          const SizedBox(
            child: Image(
              image: AssetImage('assets/404NotFound.png'),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
