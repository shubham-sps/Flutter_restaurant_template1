import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/after_login/bookings/controller.dart';

class BookingsScreen extends GetView<BookingsController> {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Bookings',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(width: 30.w),
                ],
              ),
              SizedBox(height: 20.h),
              const TabBar(
                tabs: [
                  Tab(
                    text: 'Upcoming',
                  ),
                  Tab(
                    text: 'Previous',
                  ),
                  Tab(
                    text: 'Cancelled',
                  ),
                ],
              ),
              // const TabBarView(
              //   children: [
              //     Center(
              //       child: Text('data1'),
              //     ),
              //     Center(
              //       child: Text('data2'),
              //     ),
              //     Center(
              //       child: Text('data3'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
