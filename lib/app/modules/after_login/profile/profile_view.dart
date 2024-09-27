import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/after_login/profile/controller.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

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
                    'Profile',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  SizedBox(width: 30.w),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: orangeGradient(),
                      // image: const DecorationImage(
                      //   image: AssetImage('assetName'),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Name of User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              const Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  const DescriptionContainer(
                    title: 'Bookings:',
                    detail: 'no. of bookings',
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  const DescriptionContainer(
                    title: 'Orders:',
                    detail: 'total no. of orders ',
                  ),
                ],
              ),
              const DescriptionContainer(
                title: "Address:",
                detail: 'address of user',
              ),
              Row(
                children: [
                  const DescriptionContainer(
                    title: 'Contact No.:',
                    detail: '123456789',
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  const DescriptionContainer(
                    title: 'Email:',
                    detail: 'asdf@kafljh.com',
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    super.key,
    required this.title,
    required this.detail,
  });

  final String title;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color.fromARGB(255, 124, 123, 123),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              detail,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
