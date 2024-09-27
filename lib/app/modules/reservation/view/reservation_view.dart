import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';
import 'package:restaurant_template/app/modules/reservation/controller.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class ReservationScreen extends GetView<ReservationController> {
  ReservationScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Obx(
            () => !controller.isLoading.value
                ? const SizedBox()
                : Form(
                    key: formKey,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 14.h, bottom: 10.h),
                              child: Text(
                                'Booking for: ',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.bookingFor.value = 'Myself';
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: 0.37.sw,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.h),
                                      gradient: controller.bookingFor.value == 'Myself' ? orangeGradient() : greyGradient(),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Myself',
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'OR',
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.bookingFor.value = 'Someone Else';
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: 0.37.sw,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.h),
                                        gradient: controller.bookingFor.value == 'Someone Else' ? orangeGradient() : greyGradient()),
                                    child: Center(
                                      child: Text(
                                        'Someone Else',
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 14.h, bottom: 10.h),
                              child: Text(
                                'Do you want to book the',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.bookingItem.value = 'Table';
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: 0.37.sw,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.h),
                                        gradient: controller.bookingItem.value == 'Table' ? orangeGradient() : greyGradient()),
                                    child: Center(
                                      child: Text(
                                        'Table',
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'OR',
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.bookingItem.value = 'Venue';
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: 0.37.sw,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.h),
                                        gradient: controller.bookingItem.value == 'Venue' ? orangeGradient() : greyGradient()),
                                    child: Center(
                                      child: Text(
                                        'Venue',
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            const Divider(
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.h, bottom: 14.h),
                              child: Text(
                                'Which day?',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 20.h,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2024),
                                      lastDate: DateTime(2025),
                                    ).then((selectedDate) {
                                      if (selectedDate != null) {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((selectedTime) {
                                          if (selectedTime != null) {
                                            controller.selectedDateTime.value = DateTime(
                                              selectedDate.year,
                                              selectedDate.month,
                                              selectedDate.day,
                                              selectedTime.hour,
                                              selectedTime.minute,
                                            );
                                            controller.isDateSelected.value = true;
                                          }
                                        });
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 30.h,
                                    width: 0.7.sw,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4.r),
                                      ),
                                      border: Border.all(
                                        color: Colors.grey[500]!,
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          !controller.isDateSelected.value
                                              ? "Select Date & Time"
                                              : "${controller.selectedDateTime.value.day}/${controller.selectedDateTime.value.month}/${controller.selectedDateTime.value.year}  at ${controller.selectedDateTime.value.hour} : ${controller.selectedDateTime.value.minute} ${controller.selectedDateTime.value.timeZoneName}",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            controller.bookingItem.value == 'Venue'
                                ? const SizedBox()
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 30.h, bottom: 14.h),
                                        child: Text(
                                          'For How Many?',
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                      ),
                                      ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return const LinearGradient(
                                              begin: Alignment(0.7, -1.7),
                                              end: Alignment(1, -2),
                                              colors: <Color>[Colors.black, Colors.transparent]).createShader(bounds);
                                        },
                                        blendMode: BlendMode.dstIn,
                                        child: SizedBox(
                                          height: 40.h,
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              ...List.generate(
                                                14,
                                                (index) => GestureDetector(
                                                  onTap: () {
                                                    controller.selectedGuests.value = (index + 1);
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                                                    child: Container(
                                                      width: 50.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5.h),
                                                        gradient: index + 1 == controller.selectedGuests.value ? orangeGradient() : greyGradient(),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          (index + 1).toString(),
                                                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            SizedBox(height: 20.h),
                            const Divider(
                              color: Colors.white,
                            ),
                            Column(
                              children: [
                                SizedBox(height: 20.h),
                                Text(
                                  'Contact Info',
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      controller.nameController.value.text = value;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Full Name',
                                      labelStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.h,
                                        ),
                                      ),
                                    ),
                                    controller: controller.nameController.value,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Name of the party";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      controller.contactController.value.text = value;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Contact No.',
                                      labelStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.h,
                                        ),
                                      ),
                                    ),
                                    controller: controller.contactController.value,
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter your contact No.";
                                      } else if (value.length < 10) {
                                        return "Contact number must be 10 digits";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      controller.emailController.value.text = value;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email Id',
                                      labelStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.h,
                                        ),
                                      ),
                                    ),
                                    controller: controller.emailController.value,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter your email Id";
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    //await nextPageCall(context);
                                    validateAndSave();
                                  },
                                  child: Container(
                                    height: 40.h,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.h), gradient: orangeGradient()),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                                        child: Text(
                                          'Continue',
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
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void validateAndSave() async {
    final form = formKey.currentState;
    if (form!.validate() && controller.isDateSelected.value) {
      print(form.validate());
      Get.toNamed(RouteName.reservationsConfirm);
    } else {
      print(form.validate());
      print('form is invalid');
    }
  }
}
