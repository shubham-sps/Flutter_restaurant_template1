import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/after_login/bookings/controller.dart';

class OrdersScreen extends GetView<BookingsController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                      'Orders',
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    SizedBox(width: 30.w),
                  ],
                ),
                SizedBox(height: 20.h),
                const TabBar(
                  tabs: [
                    Tab(
                      text: 'Ongoing Order',
                    ),
                    Tab(
                      text: 'Ongoing Order',
                    ),
                    Tab(
                      text: 'Ongoing Order',
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                //   TabBarView(
                //     children: [
                //       Flexible(
                //         child: Container(
                //           height: 100.h,
                //           width: 200,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(15.0),
                //             gradient: oceanGradient(),
                //           ),
                //           child: const Padding(
                //             padding: EdgeInsets.all(20.0),
                //             child: Row(
                //               children: [
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text('dd/mm/yyyy'),
                //                     Text('You ordered:'),
                //                     Text('....'),
                //                     Text('....'),
                //                   ],
                //                 ),
                //                 Text('pRICE \$'),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       Flexible(
                //         child: Container(
                //           height: 100.h,
                //           width: 200,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(15.0),
                //             gradient: oceanGradient(),
                //           ),
                //           child: const Padding(
                //             padding: EdgeInsets.all(20.0),
                //             child: Row(
                //               children: [
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text('dd/mm/yyyy'),
                //                     Text('You ordered:'),
                //                     Text('....'),
                //                     Text('....'),
                //                   ],
                //                 ),
                //                 Text('pRICE \$'),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       Flexible(
                //         child: Container(
                //           height: 100.h,
                //           width: 200,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(15.0),
                //             gradient: oceanGradient(),
                //           ),
                //           child: const Padding(
                //             padding: EdgeInsets.all(20.0),
                //             child: Row(
                //               children: [
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text('dd/mm/yyyy'),
                //                     Text('You ordered:'),
                //                     Text('....'),
                //                     Text('....'),
                //                   ],
                //                 ),
                //                 Text('pRICE \$'),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // const TabBarView(
                //   children: [Text('Ongoing'), Text('Previous'), Text('Cancelled')],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
