import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';
import 'package:restaurant_template/app/modules/dashboard/contoller.dart';
import 'package:restaurant_template/app/modules/dashboard/widgets/build_drawer_items.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({super.key});

  List<String> img = ['slider1', 'slider2', 'slider3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (controller.addToCartCounter.value == 0) {
                // do not take to cart screen
                Get.showSnackbar(
                  const GetSnackBar(
                    title: "Oops",
                    message: "No items added to cart",
                    duration: Duration(seconds: 1, milliseconds: 300),
                  ),
                );
                return;
              }
              Get.toNamed(RouteName.cart);
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
        title: const Text(
          'Restaurant Name',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1.0,
          sigmaY: 1.0,
        ),
        child: Drawer(
          backgroundColor: const Color.fromARGB(255, 27, 25, 25).withOpacity(0.8),
          child: SingleChildScrollView(
            child: Column(
              children: [BuildMenuItems(context: context)],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ongoing Offers',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: img.map((e) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 20, 2, 36),
                          Color.fromARGB(255, 146, 112, 146),
                        ],
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/$e.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
              // Container(
              //   height: 200,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30.0),
              //     gradient: const LinearGradient(
              //       begin: Alignment.topLeft,
              //       end: Alignment.bottomRight,
              //       colors: [
              //         Color.fromARGB(255, 20, 2, 36),
              //         Color.fromARGB(255, 146, 112, 146),
              //       ],
              //     ),
              //     image: const DecorationImage(
              //       image: AssetImage('assets/slider1.png'),
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.menu);
                        },
                        child: Container(
                          height: 150,
                          width: 180,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.7.w,
                              color: Colors.white,
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.menu_book_outlined,
                                color: Color.fromARGB(255, 117, 113, 113),
                                size: 100,
                              ),
                              Text(
                                'Menu',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 117, 113, 113),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.reservations);
                        },
                        child: Container(
                          height: 150,
                          width: 180,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.7.w,
                              color: Colors.white,
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.bookmark_add_outlined,
                                color: Color.fromARGB(255, 117, 113, 113),
                                size: 100,
                              ),
                              Text(
                                'Reservation',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 117, 113, 113),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: 'Hmm!',
                          message: 'looks like there are no photos in galllery',
                          duration: Duration(seconds: 1, milliseconds: 500),
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 180,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.7.w,
                          color: Colors.white,
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo_outlined,
                            color: Color.fromARGB(255, 117, 113, 113),
                            size: 100,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 117, 113, 113),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 14.h),
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           Get.toNamed(RouteName.menu);
              //         },
              //         child: Container(
              //           height: 30,
              //           width: 100.w,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(15),
              //             gradient: orangeGradient(),
              //           ),
              //           child: const Center(
              //             child: Text(
              //               'Load More',
              //               style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   )
              //
            ],
          ),
        ),
      ),
    );
  }
}
