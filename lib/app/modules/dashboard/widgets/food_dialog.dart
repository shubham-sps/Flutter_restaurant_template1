import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/dashboard/contoller.dart';
import 'package:restaurant_template/app/modules/menu/modals/fooditems_response_modal.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class FoodDialog extends GetView<DashboardController> {
  const FoodDialog(this.foodItem, {super.key});

  final Items foodItem;
  static RxInt quantity = 1.obs;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
      child: Obx(
        () => controller.isLoading.value
            ? const SizedBox()
            : Container(
                height: 0.6.sh,
                width: 0.5.sw,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.h), gradient: oceanGradient()),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/foodImages/${foodItem.name!}.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12.h), topRight: Radius.circular(12.h)),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              height: 20.h,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.h),
                                    bottomLeft: Radius.circular(10.h),
                                  ),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.star_sharp,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                    Text(
                                      '4.3',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.h),
                        child: Text(
                          foodItem.name!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.h, 0, 8.h, 8.h),
                        child: Text(
                          foodItem.shortDescription!,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (quantity > 1) {
                                  quantity.value--;
                                  foodItem.quantity--;
                                }
                              },
                              child: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text('$quantity'),
                            ),
                            GestureDetector(
                              onTap: () {
                                quantity.value++;
                                foodItem.quantity++;
                              },
                              child: const Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$ ${(quantity * double.parse(foodItem.price!)).toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: const Divider(
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Addon 1',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Radio(
                          fillColor: const MaterialStatePropertyAll(Colors.white),
                          value: 1,
                          groupValue: controller.selectedRadioButton.value,
                          onChanged: (value) {
                            controller.selectedRadioButton.value = value as int;
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Addon 2',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Radio(
                          value: 2,
                          fillColor: const MaterialStatePropertyAll(Colors.white),
                          focusColor: Colors.white,
                          groupValue: controller.selectedRadioButton.value,
                          onChanged: (value) {
                            controller.selectedRadioButton.value = value as int;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: const Divider(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 0.5.w,
                              ),
                            ),
                            hintText: 'Instructions(Optional)',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                      //   child: const Divider(
                      //     color: Colors.white,
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                controller.onAddToCart(foodItem.id!);
                                Get.back();
                                quantity.value = 1;
                              },
                              child: Container(
                                height: 34.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.h),
                                  gradient: orangeGradient(),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                                    child: const Text(
                                      'Add',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // ElevatedButton(
                            //   onPressed: () async {
                            //     controller.onAddToCart(foodItem.id!);
                            //     Get.back();
                            //     quantity.value = 1;
                            //   },
                            //   child: Center(
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(horizontal: 20.w),
                            //       child: const Text(
                            //         'Add',
                            //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 34.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.h),
                                  gradient: orangeGradient(),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
