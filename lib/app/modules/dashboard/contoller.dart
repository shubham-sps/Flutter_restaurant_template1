import 'package:get/get.dart';
import 'package:restaurant_template/app/services/storage/local_storage_service.dart';
import 'package:restaurant_template/main.dart';

class DashboardController extends GetxController {
  var selectedRadioButton = 0.obs;
  RxInt addToCartCounter = 0.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    // load cart value
    isLoading.value = true;
    await loadCartValue();
    isLoading.value = false;
  }

  Future<void> loadCartValue() async {
    List? cart = await LocalStorageService.readValue(cartKey);
    if (cart != null) {
      addToCartCounter.value = cart.length;
    } else {
      LocalStorageService.writeValue(key: cartKey, value: []);
    }
  }

  void onAddToCart(int id) async {
    await LocalStorageService.addValue(key: cartKey, newValue: id);
    loadCartValue();
  }
}
