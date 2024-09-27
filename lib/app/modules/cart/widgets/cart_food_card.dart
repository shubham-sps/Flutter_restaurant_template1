import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/cart/controller.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class CartFoodCard extends GetView<CartController> {
  const CartFoodCard(
    this.index, {
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    RxInt qty = controller.cartList[index].quantity;

    return Obx(
      () => controller.isLoading.value
          ? const SizedBox()
          : Container(
              height: 105,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), gradient: oceanGradient()),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //height: 80.h,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/foodImages/${controller.cartList[index].name!}.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 150.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.cartList[index].name!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Customization',
                            style: TextStyle(fontSize: 10),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (qty > 1) qty--;
                                  controller.cPrice();
                                },
                                child: const Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('$qty'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  qty++;
                                  controller.cPrice();
                                },
                                child: const Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.removeItem(controller.cartList[index].id!);
                            qty.value = 1;
                          },
                          child: const Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$ ${(qty * double.parse(controller.cartList[index].price!)).toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
