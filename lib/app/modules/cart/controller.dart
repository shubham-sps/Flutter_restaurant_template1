import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/dashboard/contoller.dart';
import 'package:restaurant_template/app/modules/menu/controller.dart';
import 'package:restaurant_template/app/modules/menu/modals/fooditems_response_modal.dart';
import 'package:restaurant_template/app/services/network_layer/network_layer.dart';
import 'package:restaurant_template/app/services/storage/local_storage_service.dart';
import 'package:restaurant_template/main.dart';

class CartController extends GetxController {
  final isLoading = false.obs;
  final cartList = <Items>[].obs;
  Rx<TaxModal> taxmodal = TaxModal().obs;
  num orderTotal = 0.00;
  num totalTax = 0.00;
  num grandTotal = 0.00;
  RxDouble oTotal = 0.00.obs;
  RxDouble tTax = 0.00.obs;
  RxDouble gTotal = 0.00.obs;

  @override
  void onReady() {
    loadCartData();

    super.onReady();
  }

  Future loadCartData() async {
    isLoading.value = true;
    try {
      cartList.clear();
      dynamic taxesRes = await NetworkLayer.get("https://demo123.vrundaztech.com/api/get-tax-price");
      taxmodal.value = TaxModal.fromJson(taxesRes);

      List items = await LocalStorageService.readValue(cartKey);

      for (var i in items) {
        cartList.add(Get.find<MenuBookController>().foodItemModal.value.items!.firstWhere((element) => element.id == i));

        cartList.refresh();
        cPrice();
      }
    } finally {
      isLoading.value = false;
    }
  }

  void removeItem(int id) async {
    // remove from local storage
    await LocalStorageService.deleteValue(key: cartKey, value: id);

    await loadCartData();
    cartList.refresh();
    if (cartList.isEmpty) {
      Get.find<DashboardController>().loadCartValue();
      Get.back();
    }
  }

  Future calculatePrice() async {
    orderTotal = 0.00;
    totalTax = 0.00;
    grandTotal = 0.00;

    var fixedTax = taxmodal.value.fixPay!;
    var orderTax = (num.parse(taxmodal.value.tax!) / 100);
    for (var items in cartList) {
      //var qty = items.quantity.value;
      orderTotal = num.parse((orderTotal + num.parse(items.price!)).toStringAsFixed(2));
    }
    totalTax = (orderTotal * orderTax) + fixedTax;
    grandTotal = orderTotal + totalTax;
  }

  Future cPrice() async {
    oTotal.value = 0.00;
    tTax.value = 0.00;
    gTotal.value = 0.00;

    var fixedTax = taxmodal.value.fixPay!;
    var orderTax = (num.parse(taxmodal.value.tax!) / 100);
    for (var items in cartList) {
      oTotal.value = oTotal.value + num.parse(items.price!) * items.quantity.value;
      //oTotal = (oTotal + (((num.parse(items.price!) * items.quantity).toStringAsFixed(2) as RxDouble)) as RxDouble;
    }
    tTax.value = (oTotal.value * orderTax) + fixedTax;
    gTotal.value = oTotal.value + tTax.value;
  }
}

class TaxModal {
  String? tax;
  int? fixPay;

  TaxModal({this.tax, this.fixPay});

  TaxModal.fromJson(Map<String, dynamic> json) {
    tax = json['tax'];
    fixPay = json['fix_pay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tax'] = tax;
    data['fix_pay'] = fixPay;
    return data;
  }
}
