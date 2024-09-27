import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/dashboard/widgets/food_dialog.dart';
import 'package:restaurant_template/app/modules/menu/modals/fooditems_response_modal.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.foodItem,
  });

  final Items foodItem;

  @override
  Widget build(BuildContext context) {
    String foodImage = foodItem.name!;
    return Container(
      //height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.h), gradient: oceanGradient()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () async {
                      await Get.dialog(FoodDialog(foodItem));
                    },
                    child: Container(
                      height: 120,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/foodImages/$foodImage.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 21,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.h),
                          bottomLeft: Radius.circular(10.h),
                        ),
                        color: Colors.grey.withOpacity(0.2)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star_sharp,
                            color: Colors.white,
                            size: 12.h,
                          ),
                          const Text(
                            '4.3',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5, top: 10),
            child: Text(
              foodItem.name!,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                foodItem.shortDescription!,
                style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 7),
            child: Row(
              children: [
                Text('\$ ${foodItem.price!}'),
                const Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: orangeGradient(),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      await Get.dialog(FoodDialog(foodItem));
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
