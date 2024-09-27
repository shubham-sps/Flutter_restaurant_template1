import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/contact_us/controller.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class ContactScreen extends GetView<ContactController> {
  const ContactScreen({super.key});

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
                    'Contact Us',
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
                        Icons.map_outlined,
                        size: 80,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Address of the Resturant',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.clip,
                  )
                ],
              ),
              SizedBox(height: 20.h),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(height: 10.h),
              const Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Opening Time: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Text('Monday'),
                        SizedBox(width: 40),
                        Text(':'),
                        Spacer(),
                        Column(
                          children: [
                            Text('10:30 AM - 02:30 PM'),
                            Text('05:00 PM - 09:00 PM'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Text('Tuesday'),
                        SizedBox(width: 40),
                        Text(':'),
                        Spacer(),
                        Text('Closed'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Text('Wednesday'),
                        SizedBox(width: 40),
                        Text(':'),
                        Spacer(),
                        Column(
                          children: [
                            Text('10:30 AM - 02:30 PM'),
                            Text('05:00 PM - 09:00 PM'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Text('Thursday'),
                        SizedBox(width: 40),
                        Text(':'),
                        Spacer(),
                        Column(
                          children: [
                            Text('10:30 AM - 02:30 PM'),
                            Text('05:00 PM - 09:00 PM'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Text('Friday'),
                        SizedBox(width: 40),
                        Text(':'),
                        Spacer(),
                        Column(
                          children: [
                            Text('11:30 AM - 02:30 PM'),
                            Text('05:00 PM - 09:30 PM'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Text('Saturday'),
                        SizedBox(width: 40),
                        Text(':'),
                        Spacer(),
                        Column(
                          children: [
                            Text('11:30 AM - 02:30 PM'),
                            Text('05:00 PM - 09:30 PM'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Text('Sunday'),
                        SizedBox(width: 40),
                        Text(':'),
                        Spacer(),
                        Column(
                          children: [
                            Text('11:30 AM - 02:30 PM'),
                            Text('05:00 PM - 09:30 PM'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const DescriptionContainer(title: 'Contact :', detail: '+9765432112 , 123456987'),
              const DescriptionContainer(title: 'Email :', detail: 'vnd@gmail.com')
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
