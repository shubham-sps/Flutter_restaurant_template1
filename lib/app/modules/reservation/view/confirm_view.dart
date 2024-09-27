import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';
import 'package:restaurant_template/app/modules/reservation/controller.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class ReservationConfirmScreen extends GetView<ReservationController> {
  const ReservationConfirmScreen({super.key});

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
                    'Reservation',
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
                    ),
                    child: Center(
                      child: Text(
                        "${controller.selectedDateTime.value.day}/${controller.selectedDateTime.value.month}/${controller.selectedDateTime.value.year}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 0.6.sw,
                    child: const Text(
                      'Please Confirm the details entered are correct and proceed to submit the booking.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  DescriptionContainer(
                    title: 'Booking for:',
                    detail: controller.bookingFor.value,
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  DescriptionContainer(
                    title: 'Time:',
                    detail: '${controller.selectedDateTime.value.hour} : ${controller.selectedDateTime.value.minute}',
                  ),
                ],
              ),
              Row(
                children: [
                  DescriptionContainer(
                    title: "You've booked:",
                    detail: controller.bookingItem.value,
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  controller.bookingItem.value == 'Venue'
                      ? const SizedBox()
                      : DescriptionContainer(
                          title: 'No. of Guests:',
                          detail: '${controller.selectedGuests.value}',
                        ),
                ],
              ),
              DescriptionContainer(
                title: "Booking is in name of :",
                detail: controller.nameController.value.text,
              ),
              Row(
                children: [
                  DescriptionContainer(
                    title: 'Contact No.:',
                    detail: controller.contactController.value.text,
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  DescriptionContainer(
                    title: 'Email:',
                    detail: controller.emailController.value.text,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.reservationsSuccess);
                    },
                    child: Container(
                      height: 40.h,
                      width: 0.6.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.h),
                        gradient: orangeGradient(),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Text(
                            'Confirm Booking !',
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
