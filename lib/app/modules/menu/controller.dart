import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/menu/modals/categories_response_modal.dart';
import 'package:restaurant_template/app/modules/menu/modals/fooditems_response_modal.dart';
import 'package:restaurant_template/app/services/network_layer/network_layer.dart';

class MenuBookController extends GetxController {
  final pageController = PageController();
  final selectedfoodtype = "Beverages".obs;
  RxInt selectedCategoryId = 0.obs;
  Rx<FoodCategoryModal> categoryModal = FoodCategoryModal().obs;
  Rx<FoodItemsModal> foodItemModal = FoodItemsModal().obs;
  List foodCategory = <dynamic>[].obs;
  final isLoading = false.obs;
  RxList<Items> filteredFoodItem = <Items>[].obs;

  @override
  void onInit() {
    loadData();

    super.onInit();
  }

  Future<dynamic> loadData() async {
    isLoading.value = true;

    try {
      dynamic categoriesRes = await NetworkLayer.get('https://demo123.vrundaztech.com/api/categories');
      categoryModal.value = FoodCategoryModal.fromJson(categoriesRes);
      // categoryModal.value.categories
      //     ?.removeRange(3, categoryModal.value.categories!.length - 1);
      selectedCategoryId.value = categoryModal.value.categories?[0].id ?? 0;
      dynamic foodItemRes = await NetworkLayer.get('https://demo123.vrundaztech.com/api/items');
      foodItemModal.value = FoodItemsModal.fromJson(foodItemRes);
      filterFoodItems();
    } finally {
      isLoading.value = false;
    }
  }

  void filterFoodItems() {
    filteredFoodItem.clear();
    filteredFoodItem.addAll(foodItemModal.value.items?.where((element) {
          return element.categoryId! == selectedCategoryId.value.toString();
        }) ??
        []);
    filteredFoodItem.refresh();
  }
}
