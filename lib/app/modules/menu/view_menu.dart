import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';
import 'package:restaurant_template/app/modules/dashboard/contoller.dart';
import 'package:restaurant_template/app/modules/dashboard/widgets/foodcard.dart';
import 'package:restaurant_template/app/modules/menu/controller.dart';

class MenuScreen extends GetView<MenuBookController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50.h,
              ))
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                  children: [
                    SizedBox(height: 35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Menu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (Get.put(DashboardController()).addToCartCounter.value == 0) {
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
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(begin: Alignment(0.7, -1.0), end: Alignment(1.0, -1.0), colors: <Color>[Colors.black, Colors.transparent])
                            .createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categoryModal.value.categories?.length ?? 0,
                          itemBuilder: (_, __) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.isLoading.value = true;
                                      controller.selectedCategoryId.value = controller.categoryModal.value.categories![__].id ?? 0;
                                      controller.filterFoodItems();
                                      controller.isLoading.value = false;
                                    },
                                    child: SizedBox(
                                      child: Text(
                                        controller.categoryModal.value.categories![__].name ?? "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: controller.categoryModal.value.categories![__].id == controller.selectedCategoryId.value
                                              ? Colors.orange
                                              : const Color.fromARGB(255, 164, 165, 168),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: controller.categoryModal.value.categories![__].id == controller.selectedCategoryId.value
                                          ? Colors.orange
                                          : Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.h),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: int.parse((MediaQuery.of(context).size.width ~/ 165).toString()),
                            childAspectRatio: 0.62,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 14,
                          ),
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          //shrinkWrap: false,
                          itemCount: controller.filteredFoodItem.length,
                          itemBuilder: (_, __) => FoodCard(
                            foodItem: controller.filteredFoodItem[__],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
