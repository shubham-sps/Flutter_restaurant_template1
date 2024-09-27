import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/cart/controller.dart';
import 'package:restaurant_template/app/modules/cart/widgets/cart_food_card.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

// ignore: must_be_immutable
class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  // Map<String, dynamic>? paymentIntent;

  // void makePayment() async {
  //   try {
  //     paymentIntent = await createPaymentIntent();

  //     var gpay = const PaymentSheetGooglePay(
  //       merchantCountryCode: "US",
  //       currencyCode: "US",
  //       testEnv: true,
  //     );
  //     await Stripe.instance.initPaymentSheet(
  //       paymentSheetParameters: SetupPaymentSheetParameters(
  //         paymentIntentClientSecret: paymentIntent!["client_secret"],
  //         style: ThemeMode.dark,
  //         merchantDisplayName: "Shubham",
  //         googlePay: gpay,
  //       ),
  //     );
  //   } catch (e) {}
  // }

  // void displayPaymentSheet() async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //     print('Done');
  //   } catch (e) {
  //     print('Failed');
  //   }
  // }

  // createPaymentIntent() async {
  //   try {
  //     Map<String, dynamic> body = {
  //       "amount": "1000",
  //       "currency": "USD",
  //     };

  //     http.Response response = await http.post(
  //       Uri.parse("https://api.stripe.com/v1/payment_intents"),
  //       body: body,
  //       headers: {
  //         "Authentication": "Bearer sk_test_51ObfkYSIOzaVVU17potuNGqXrVT9XTVA6LWZxeQHbx3KOoaHMdsglMUVtWjhKAoTWtniyU1hsOk8Um6jJ2EA6SU100sm5mBV4M",
  //         "Content-Type": "application/x-www-form-urlencoded",
  //       },
  //     );
  //     return json.decode(response.body);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const SizedBox()
            : Column(
                children: [
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Cart',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: SizedBox(
                      height: 0.57.sh,
                      child: ListView(
                        children: [
                          ...List.generate(
                            controller.cartList.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: CartFoodCard(index),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r),
                      ),
                      gradient: greyGradient(),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Price details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              const Text(
                                'Order details',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "\$${controller.oTotal.value.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              const Text(
                                'Tax',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "\$${controller.tTax.value.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Discount',
                          //       style: TextStyle(
                          //         fontSize: 12.sp,
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //     const Spacer(),
                          //     Text(
                          //       '\$0',
                          //       style: TextStyle(
                          //         fontSize: 12.sp,
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 5.h),
                          const Divider(
                            color: Colors.white,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Grand total',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '\$${controller.gTotal.value.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              // makePayment();
                              print('payment');
                            },
                            child: Container(
                              height: 40.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.h),
                                gradient: orangeGradient(),
                              ),
                              child: const Center(
                                child: Text(
                                  'Proceed to checkout',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
